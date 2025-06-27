<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Gateway</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #e9ecef;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: url('payment.jpeg') no-repeat center center;
            background-size: cover;
            overflow: hidden;
        }

        .container {
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #777;
        }

        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s;
        }

        input:focus {
            border-color: #007bff;
            outline: none;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: rgb(19,101,103);
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: rgb(15, 15, 207);
        }

        #message {
            margin-top: 20px;
            text-align: center;
            font-weight: bold;
            color: #007bff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Payment Gateway</h1>
        <form id="payment-form" action="PaymentServlet1" method="post">
            <div class="form-group">
                <label for="card-number">Card Number</label>
                <input type="text" id="card-number" name="card-number" placeholder="Card Number" required>
            </div>
            <div class="form-group">
                <label for="cardholder-name">Cardholder Name</label>
                <input type="text" id="cardholder-name" name="cardholder-name" placeholder="Cardholder Name" required>
            </div>
            <div class="form-group">
                <label for="expiry">Expiry Date (MM/YY)</label>
                <input type="text" id="expiry" name="expiry" placeholder="MM/YY" required>
            </div>
            <div class="form-group">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="CVV" required>
            </div>
            <button type="submit" href="Patienthome.jsp">Pay Now</button>
        </form>
        <div id="message"></div>
    </div>
    <script>
        document.getElementById('payment-form').addEventListener('submit', function(event) {
            event.preventDefault();

            const cardholderName = document.getElementById('cardholder-name').value.trim();
            const cardNumber = document.getElementById('card-number').value.trim();
            const expiry = document.getElementById('expiry').value.trim();
            const cvv = document.getElementById('cvv').value.trim();

            // Validate card number (must be 16 digits)
            const isValidCardNumber = (number) => {
                return /^\d{16}$/.test(number);
            };

            // Validate expiry date (MM/YY)
            const isValidExpiryDate = (expiry) => {
                const [month, year] = expiry.split('/').map(num => parseInt(num, 10));
                const now = new Date();
                const currentMonth = now.getMonth() + 1;
                const currentYear = now.getFullYear() % 100;
                return month >= 1 && month <= 12 && (year > currentYear || (year === currentYear && month >= currentMonth));
            };

            // Validate CVV (must be 3 digits)
            const isValidCVV = (cvv) => {
                return /^\d{3}$/.test(cvv);
            };

            // Validation messages
            let message = '';
            if (!cardholderName) {
                message = 'Cardholder name is required.';
            } else if (!isValidCardNumber(cardNumber)) {
                message = 'Card number must be 16 digits.';
            } else if (!isValidExpiryDate(expiry)) {
                message = 'Invalid expiry date.';
            } else if (!isValidCVV(cvv)) {
                message = 'CVV must be 3 digits.';
            } else {
                message = 'Payment successful! Thank you, ' + cardholderName + '.';
                alert(message); // Show popup

                // After validation success, allow form to submit
                document.getElementById('payment-form').submit();
            }

            document.getElementById('message').innerText = message;
        });
    </script>
</body>
</html>
