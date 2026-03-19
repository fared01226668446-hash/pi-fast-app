<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Al Fareed Office - Pi App</title>
    <script src="https://sdk.minepi.com/pi-sdk.js"></script>
</head>
<body style="text-align:center; padding-top: 50px; font-family: Arial, sans-serif;">

    <h2>مكتب الفريد - مشروع التداول</h2>
    
    <button onclick="loginWithPi()" style="padding: 15px 30px; font-size: 18px; cursor: pointer; background-color: #673ab7; color: white; border: none; border-radius: 8px;">
        تسجيل الدخول عبر Pi
    </button>
    
    <h3 id="status" style="margin-top: 20px; color: #555;">في انتظار الاتصال بالشبكة...</h3>

    <script>
        // تهيئة الـ SDK
        Pi.init({ version: "2.0", sandbox: true }); 

        async function loginWithPi() {
            try {
                const scopes = ['username', 'payments'];
                const auth = await Pi.authenticate(scopes, onIncompletePaymentFound);
                
                document.getElementById('status').innerText = "أهلاً بك: " + auth.user.username;
                document.getElementById('status').style.color = "green";
                console.log("Success!", auth);
            } catch (e) {
                document.getElementById('status').innerText = "حدث خطأ في الاتصال";
                document.getElementById('status').style.color = "red";
                alert("Error: " + e.message);
            }
        }

        function onIncompletePaymentFound(payment) {
            console.log("يوجد عملية دفع معلقة:", payment);
        }
    </script>
</body>
</html>
