package cl.bancoestado.empresas;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.os.Bundle;

// entrust
import com.entrust.identityGuard.mobile.sdk.ActivationLaunchUrlParams;
import com.entrust.identityGuard.mobile.sdk.Identity;
import com.entrust.identityGuard.mobile.sdk.IdentityProvider;
import com.entrust.identityGuard.mobile.sdk.LaunchUrlParams;
import com.entrust.identityGuard.mobile.sdk.PlatformDelegate;
import com.entrust.identityGuard.mobile.sdk.Transaction;
import com.entrust.identityGuard.mobile.sdk.TransactionMode;
import com.entrust.identityGuard.mobile.sdk.TransactionProvider;
import com.entrust.identityGuard.mobile.sdk.TransactionResponse;
import com.entrust.identityGuard.mobile.sdk.exception.EncryptionRequiredException;
import com.entrust.identityGuard.mobile.sdk.exception.IdentityGuardMobileException;
import com.entrust.identityGuard.mobile.sdk.tokenproviders.ThirdPartyTokenManagerFactory;

//context
import static android.content.Context.MODE_PRIVATE;
import android.content.Context;
import android.content.SharedPreferences;

import android.net.Uri;
import android.os.AsyncTask;
import android.util.Base64;

import org.json.JSONObject;
import java.util.ArrayList;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "channel/app_beche_poc";

    public static MainActivity instance;
    private static boolean mActive = false;
    private static String mAddress;
    private static String mRegPwd;
    private static String mSerNum;
    private static String deviceId;
    private static Context mContext;

    private static final String IDENTITY = "Identity";
    private static final String REGISTRATION_URL = "IdentityRegistrationURL";

    private static Identity identity;
    private ArrayList<Transaction> pendingTransactions;
    private Transaction mTransaction;

    private static String mensajeError;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            switch (call.method) {

                                case "getInstance":
                                    String deviceId = call.argument("deviceId");
                                    System.out.println("getInstance In");
                                    getInstance(getApplicationContext(), deviceId);
                                    System.out.println("getInstance Out");

                                    result.success("instanceOk");
                                    break;

                                case "insertSeed":
                                    System.out.println("insertSeed In");

                                    String url = call.argument("activationOnlineHttpURL");
                                    Identity semilla = setOnlineActivation(url);
                                    System.out.println("insertSeed Out");

                                    result.success("seedOk");

                                    break;

                                case "getOTP":
                                    System.out.println("getOTP In");

                                    String otp = getOTP();
                                    System.out.println(otp);
                                    System.out.println("getOTP Out");

                                    result.success(otp);

                                    break;

                                case "getTransactions":
                                    System.out.println("getTransactions In");

                                    Transaction transaction = getTransactions();

                                    System.out.println("TransactionId");
                                    System.out.println(transaction);
                                    System.out.println("getTransactions Out");

                                    if (transaction == null) {
                                        System.out.println("getTransactions null");

                                        result.success("");
                                    } else {
                                        System.out.println("getTransactions success");

                                        result.success(transaction.getTransactionId());
                                    }

                                    break;
                                case "setResponseTransaction":
                                System.out.println("setResponseTransaction In");

                                    String transactionId = call.argument("transactionId");
                                    String action = call.argument("action");

                                    boolean acceptTransaccion = setResponseTransaction(transactionId, action);
                                    System.out.println("setResponseTransaction In");

                                    result.success(acceptTransaccion);

                                    break;

                                default:
                                    result.notImplemented();

                            }

                        });
    }

    public MainActivity() {

    }

    public MainActivity(Context ctx) {

    }

    public static MainActivity getInstance(Context ctx, String fmcFirebaseToken) {

        instance = new MainActivity(ctx);
        instance.mContext = ctx;

        MainActivity.mContext = ctx;
        MainActivity.deviceId = fmcFirebaseToken;
        PlatformDelegate.setLogLevel(PlatformDelegate.LOG_LEVEL_OFF);

        PlatformDelegate.initialize(ctx);
        PlatformDelegate.setApplicationScheme("scheme");
        PlatformDelegate.setApplicationId("com.example.app_beche_poc");
        PlatformDelegate.setApplicationVersion("4.0.0");

        ThirdPartyTokenManagerFactory.setContext(ctx);
        if (instance.checkIdentityExistOrNot(ctx)) {
            mActive = true;
        }
        return instance;
    }

    public Identity setOnlineActivation(String link) {
        try {
            System.out.println("mContext 2");
            System.out.println(mContext);
            Intent intent = new Intent();
            Uri myUri = Uri.parse(link);
            intent.setData(myUri);
            parseLaunchUrlParameters(intent);
            CreateRegisterIdentity cri = new CreateRegisterIdentity(mContext, deviceId, mRegPwd, mAddress, mSerNum);
            cri.execute().get();
            return identity;

        } catch (Exception e) {
            System.out.println("ERROR: " + e);
            mensajeError = e.getMessage();
            return null;
        }

    }

    public Transaction getTransactionFromPushNotification(String instanceid, String txnid) {

        try {
            if (txnid == null) {
                return null;
            }
            if (identity == null) {
                return null;
            }
            fetchTransaction txnTask = new fetchTransaction(txnid, identity);
            Transaction transaction = txnTask.execute().get();
            mTransaction = transaction;
            return transaction;

        } catch (Exception e) {
            mensajeError = e.getMessage();
            System.out.println("ERROR: " + mensajeError);
            return null;
        }

    }

    private class fetchTransaction extends AsyncTask<Void, Void, Transaction> {
        private String mTransactionId;
        private Identity mId;

        fetchTransaction(String transactionId, Identity id) {
            mTransactionId = transactionId;
            mId = id;
        }

        /*
         * (non-Javadoc)
         * 
         * @see android.os.AsyncTask#doInBackground()
         */
        @Override
        protected Transaction doInBackground(Void... params) {

            try {
                TransactionProvider tp = new TransactionProvider(getAddress());
                return tp.fetchTransaction(PlatformDelegate.getCommCallback(), mId, mTransactionId);

            } catch (IdentityGuardMobileException e) {
                System.out.println("ERROR: " + e.getMessage());
                mensajeError = e.getMessage();
            } catch (Exception e) {
                System.out.println("ERROR: " + e.getMessage());
                mensajeError = e.getMessage();
            }

            // An exception occurred during activation/registration, so return a null object
            // for
            // the identity.
            return null;
        }

    }

    private String getAddress(String address) {
        return address.startsWith("https://") ? address : "https://" + address;
    }

    private void parseLaunchUrlParameters(Intent intent) {
        try {
            LaunchUrlParams linkParams = PlatformDelegate.parseLaunchUrl(intent);
            if (linkParams instanceof ActivationLaunchUrlParams) {
                mAddress = getAddress(((ActivationLaunchUrlParams) linkParams).getRegistrationUrl());
                mSerNum = ((ActivationLaunchUrlParams) linkParams).getSerialNumber();
                mRegPwd = ((ActivationLaunchUrlParams) linkParams)
                        .getRegistrationPassword();
            }
        } catch (IdentityGuardMobileException e) {
            throw new Error("002-" + e.getMessage());
        }
    }

    /**
     * Validate the provided soft token serial number.
     * 
     * @param sernum The serial number that needs validating.
     * @return true if the serial number is valid, false otherwise.
     */
    private boolean validateSerialNumber(String sernum) {
        try {
            IdentityProvider.validateSerialNumber(sernum);
            return true;
        } catch (Exception e) {
            // The serial number was not correct; set focus back to the
            // field where it was entered and show an alert dialog.
            System.out.println("ERROR: " + e);
            return false;
        }
    }

    /**
     * Actions to take upon successful online activation and registration.
     * 
     * @param result The created identity.
     */
    private void completeOnlineActivation(Identity result) {

        System.out.println(mContext);

        // Store our identity so it can be accessed by other activities
        setIdentity(result);
        // Store the address so that we can perform online tranactions
        setAddress(mAddress.trim());
        MainActivity.saveIdentityInformation(mContext);
        mActive = true;
    }

    public boolean getActivo() {
        return mActive;
    }

    private boolean checkIdentityExistOrNot(Context context) {
        return extractIdentityInformation(context);
    }

    public static void setIdentity(Identity midentity) {
        identity = midentity;
    }

    public static Identity getIdentity() {
        return identity;
    }

    public Identity getidentityET() {
        return identity;
    }

    /**
     * Save the Encrypted Identity, RegistrationURL and DeviceAPIVersion in saved
     * preferences.
     */
    public static void saveIdentityInformation(Context context) {
        try {
            System.out.println(context);
            System.out.println(IDENTITY);
            System.out.println(MODE_PRIVATE);

            SharedPreferences sharedPreferences = context.getSharedPreferences(IDENTITY, MODE_PRIVATE);

            SharedPreferences.Editor editor = sharedPreferences.edit();

            JSONObject jsonIdentity = getIdentity().toJSON();

            byte[] encryptedIdentity = PlatformDelegate.encryptData(context, jsonIdentity.toString().getBytes());

            editor.putString(IDENTITY, Base64.encodeToString(encryptedIdentity, Base64.DEFAULT));

            editor.putString(REGISTRATION_URL, MainActivity.getAddress());

            editor.apply();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public byte[] decryptIdentity(Context context, byte[] encryptedIdentity) {
        byte[] decrypted = null;
        try {
            try {
                return PlatformDelegate.decryptData(context, encryptedIdentity);
            } catch (EncryptionRequiredException e) {
                /*
                 * This could be because this is being run in OS >= Android M (23) device and
                 * the encryption key has not been //changed to use the new keys.
                 */
                byte[] reEncryptedData = PlatformDelegate.reEncryptDataUsingNewKeys(context, encryptedIdentity);
                // Save reEncryptedData data
                return PlatformDelegate.decryptData(context, reEncryptedData);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return decrypted;
    }

    public boolean extractIdentityInformation(Context context) {
        try {
            SharedPreferences sharedPreferences = context.getSharedPreferences(IDENTITY, MODE_PRIVATE);
            SharedPreferences.Editor editor = sharedPreferences.edit();
            String identityString = sharedPreferences.getString(IDENTITY, "");

            String identityAddress = sharedPreferences.getString(REGISTRATION_URL, "");
            if (!identityString.equals("")) {
                byte[] base64EncryptData = Base64.decode(identityString, Base64.DEFAULT);
                byte[] decryptedIdentity;
                try {
                    decryptedIdentity = PlatformDelegate.decryptData(context, base64EncryptData);
                } catch (EncryptionRequiredException e) {

                    // New Keys migration is required. This could be because this is being run in
                    // a >= Android M (23) device and the encryption key has not been changed
                    // to use the new keys.
                    byte[] encryptedIdentity = PlatformDelegate.reEncryptDataUsingNewKeys(context, base64EncryptData);
                    editor.putString(IDENTITY, Base64.encodeToString(encryptedIdentity, Base64.DEFAULT));
                    editor.apply();
                    identityString = sharedPreferences.getString(IDENTITY, "");

                    byte[] newEncodedDataBase64 = Base64.decode(identityString, Base64.DEFAULT);
                    decryptedIdentity = PlatformDelegate.decryptData(context, newEncodedDataBase64);
                }

                Identity identity = new Identity(new JSONObject(new String(decryptedIdentity)));
                setIdentity(identity);
                setAddress(identityAddress);
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void setAddress(String address) {
        mAddress = address;
    }

    public static String getAddress() {
        return mAddress;
    }

    public String getOTP() {
        try {
            // Display the security code (OTP) value and a progress bar that represents
            // a countdown until a new security code needs to be generated (i.e., the
            // OTP's lifetime). Use the available IdentityProvider formatCode() helper
            // method
            // to split the OTP into two with a separating hyphen.
            // mOTP = (TextView) findViewById(R.id.otp);
            String otp = "";

            // for (int i = 0; i < identity.getOTPLength(); i++) {
            // otp += "0";
            // }
            try {
                otp = identity.getOTP();
                return otp;
            } catch (IdentityGuardMobileException e) {
                return "ERROR: Failed to get the current OTP: " + e;
            }

        } catch (Exception e) {
            System.out.println("ERROR : " + e);
            return " " + e;
        }

    }

    /********************************************************************************/

    public Transaction getTransactions() {

        try {
            TransactionTask txnTask = new TransactionTask(mContext);
            Transaction transaction = txnTask.execute().get();
            mTransaction = transaction;
            return transaction;
        } catch (Exception e) {
            mensajeError = e.getMessage();
            System.out.println("ERROR: " + mensajeError);
            return null;
        }

    }

    private class TransactionTask extends AsyncTask<Void, Void, Transaction> {

        TransactionTask(Context context) {
            mContext = context;
        }

        /*
         * (non-Javadoc)
         * 
         * @see android.os.AsyncTask#doInBackground()
         */
        @Override
        protected Transaction doInBackground(Void... params) {

            try {
                Transaction result = null;
                // Create a new transaction provider based on the provider address.
                TransactionProvider tp = new TransactionProvider(getAddress());

                // Poll the transaction provider for new transactions.
                result = tp.poll(PlatformDelegate.getCommCallback(), identity);
                return result;
                /*
                 * pendingTransactions=result;
                 * if(pendingTransactions != null) {
                 * if(pendingTransactions.size()==1) {
                 * System.out.println("TransactionTask: onPostExecute: lista = 1");
                 * mTransaction = pendingTransactions.get(0);
                 * System.out.println(pendingTransactions.get(0).getAppName());
                 * System.out.println(pendingTransactions.get(0).getDate());
                 * System.out.println(pendingTransactions.get(0).getLifetime());
                 * System.out.println(pendingTransactions.get(0).getPriority());
                 * System.out.println(pendingTransactions.get(0).getSummary());
                 * System.out.println(pendingTransactions.get(0).getTransactionId());
                 * System.out.println(pendingTransactions.get(0).getIdentityId());
                 * System.out.println(pendingTransactions.get(0).getTransactionMode());
                 * System.out.println(pendingTransactions.get(0).getTransactionResponse());
                 * System.out.println(pendingTransactions.get(0).getUserId());
                 * System.out.println(pendingTransactions.get(0).isQueueflag());
                 * System.out.println(pendingTransactions.get(0).getDetails().toString());
                 * TransactionDetail[] transactions;
                 * transactions = pendingTransactions.get(0).getDetails();
                 * for (int i = 0; i < transactions.length; i++) {
                 * System.out.println("Details["+ i + "]: " + transactions[i].getDetail() +
                 * " |-| " + transactions[i].getValue());
                 * }
                 * 
                 * 
                 * }else {
                 * mensajeError = ("TransactionTask: onPostExecute: lista > 1");
                 * }
                 * }else {
                 * mensajeError = ("TransactionTask: onPostExecute: lista = 0");
                 * 
                 * }
                 */
            } catch (IdentityGuardMobileException e) {
                System.out.println("ERROR: " + e.getMessage());
                mensajeError = e.getMessage();
            } catch (Exception e) {
                System.out.println("ERROR: " + e.getMessage());
                mensajeError = e.getMessage();
            }

            // An exception occurred during activation/registration, so return a null object
            // for
            // the identity.
            return null;
        }

    }

    /***********************************
     * Post Transaction
     *********************************************/
    public boolean setResponseTransaction(String TransactionId, String respuesta) {
        boolean result = false;

        if (respuesta.equals("CONFIRM")) {
            mTransaction.setTransactionResponse(TransactionResponse.CONFIRM);
        } else if (respuesta.equals("CONCERN")) {
            mTransaction.setTransactionResponse(TransactionResponse.CONCERN);
        } else {
            mTransaction.setTransactionResponse(TransactionResponse.CANCEL);
        }
        try {

            if (mTransaction.getTransactionMode().toString().equals(TransactionMode.ONLINE.toString())) {
                OnlineTransactionResponse response = new OnlineTransactionResponse(mContext,
                        TransactionProvider.getConfirmationCode(getIdentity(), mTransaction));
                result = response.execute().get();
                return result;
            } else {
                return false;
            }
        } catch (Exception e) {
            throw new Error("ERROR: An error occurred while sending a transaction response." + e.getMessage());

        }
    }

    /***********************************
     * getError mensajeError
     *********************************************/
    public String getError() {
        return mensajeError;
    }

    /**
     * An asynchronous task to perform the communication with the IdentityGuard
     * Self-Service
     * Transaction Component to complete the online activation of a token.
     */
    private class CreateRegisterIdentity extends AsyncTask<Void, Void, Identity> {

        private Context mContext;
        private String mDeviceId;
        private String mRegPwd;
        private String mTransactionAddress;
        private String mSerNum;

        public CreateRegisterIdentity(Context context, String deviceId, String regPwd,
                String address, String serialNum) {
            mContext = context;
            System.out.println("mContext 3");
            System.out.println(mContext);

            mDeviceId = deviceId;
            mRegPwd = regPwd;
            mTransactionAddress = address;
            mSerNum = serialNum;
        }

        /*
         * (non-Javadoc)
         * 
         * @see android.os.AsyncTask#doInBackground()
         */
        @Override
        protected Identity doInBackground(Void... params) {

            try {

                TransactionProvider tp = new TransactionProvider(mTransactionAddress);
                tp.setContext(mContext);
                Identity id = tp.createIdentityUsingRegPassword(
                        PlatformDelegate.getCommCallback(), mRegPwd, mSerNum, mDeviceId, true, true, true, true);
                if (id != null) {
                    System.out.println("mContext 4");
                    System.out.println(mContext);

                    completeOnlineActivation(id);
                } else {
                    throw new Error("Id obtenido es Null");
                }
                return id;
            } catch (IdentityGuardMobileException e) {
                System.out.println("ERROR: " + e);
                mensajeError = e.getMessage();
            } catch (Exception e) {
                System.out.println("ERROR: registering id.: " + e);
                mensajeError = e.getMessage();
            }
            return null;
        }

    }

    private class OnlineTransactionResponse extends AsyncTask<Void, Void, Boolean> {
        private String mResponse;
        private Exception mTransactionFailedException;

        public OnlineTransactionResponse(Context context, String response) {
            mContext = context;
            mResponse = response;
        }

        @Override
        protected Boolean doInBackground(Void... params) {
            try {
                TransactionProvider tp = new TransactionProvider(getAddress());
                Boolean success = tp.authenticateTransaction(PlatformDelegate.getCommCallback(),
                        getIdentity(), mTransaction, mResponse);
                // Give the result a value if null
                success = success == null ? false : success;

                return success;
            } catch (IdentityGuardMobileException e) {
                System.out.println("ERROR: " + e.getMessage());
                mTransactionFailedException = e;
            } catch (Exception e) {
                System.out.println("ERROR: authenticating transaction: " + e.getMessage());
                mTransactionFailedException = e;
            }

            return false;
        }
    }

}