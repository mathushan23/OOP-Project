<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        section {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 100vh;
            background: url('doctor7.jpg') no-repeat;
            background-size: cover;
            background-position: center;
        }

        .login-box {
            position: relative;
            width: 400px;
            height: 450px;
            background: transparant;
            border: 2px solid rgba(255, 255, 255, 5);
            border-radius: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        h2 {
            font-size: 2em;
            color: white;
            text-align: center;
        }

        .input-box {
            position: relative;
            width: 310px;
            margin: 30px 0;
            border-bottom: 2px solid black;
        }

        .input-box label {
            position: absolute;
            top: 50%;
            left: 5px;
            transform: translateY(-50%);
            font-size: 1em;
            color: white;
            pointer-events: none;
            transition: .5s;
        }

        .input-box input:focus ~ label,
        .input-box input:valid ~ label {
            top: -5px;
        }

        .input-box input {
            width: 100%;
            height: 50px;
            background: transparent;
            border: none;
            outline: none;
            font-size: 1em;
            color: white;
            padding: 0 35px 0 5px;
        }

        .input-box .icon {
            position: absolute;
            right: 8px;
            color: white;
            font-size: 1.2em;
            line-height: 57px;
        }

        .remember-forgot {
            margin: -15px 0 15px;
            font-size: .9em;
            color: white;
            display: flex;
            justify-content: space-between;
        }

        .remember-forgot label input {
            margin-right: 3px;
        }

        .remember-forgot a {
            color: white;
            text-decoration: none;
        }

        .remember-forgot a:hover {
            text-decoration: underline;
        }

        button {
            width: 100%;
            height: 40px;
            background: white;
            border: none;
            outline: none;
            border-radius: 40px;
            cursor: pointer;
            font-size: 1em;
            color: black;
            font-weight: 700;
        }

        .register-link {
            font-size: .9em;
            color: white;
            text-align: center;
            margin: 25px 0 10px;
        }

        .register-link p a {
            color: white;
            text-decoration: none;
            font-weight: 600;
        }

        .register-link p a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <section>
        <div class="login-box">
            <form onsubmit="return validateForm();" action="LoginServlet" method="post">
                <h2>Login</h2>
                <div class="input-box">
                    <span class="icon"><ion-icon name="mail"></ion-icon></span>
                    <input type="email" id="email" name="email" required>
                    <label>Email</label>
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                    <input type="password" id="password" name="password" required>
                    <label>Password</label>
                </div>
                <div class="remember-forgot">
                    <label><input type="checkbox">Remember me</label>
                    <a href="#">Forgot Password?</a>
                </div>
                <button type="submit">Login</button>
                <div class="register-link">
                    <p>Don't have an account?<a href="#">Register</a></p>
                </div>
            </form>
        </div>
    </section>

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

    <script>
        function validateForm() {
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            if (!emailPattern.test(email)) {
                alert("Please enter a valid email address.");
                return false;
            }
            return true; // Allow form submission if validation passes
        }
    </script>
</body>
</html>
