<%-- 
    Document   : ChoosePaymentMethod
    Created on : Jul 18, 2024, 10:21:58 AM
    Author     : Mr.Khanh
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Choose Payment Method</title>
    <!-- Link to Bootstrap CSS from CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #222;
            color: #fff;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .payment-container {
            background-color: #333;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 80%;
            max-width: 600px;
        }
        .payment-container h1 {
            font-size: 2.5rem;
            margin-bottom: 30px;
            text-align: center;
        }
        .payment-option {
            margin-bottom: 20px;
            font-size: 1.2rem;
        }
    </style>
</head>
<body>
    <div class="payment-container">
        <h1>Choose Payment Method</h1>
        <form action="ProcessPaymentServlet" method="post">
            <div class="payment-option">
                <input type="radio" id="creditCard" name="paymentMethod" value="Credit Card" required>
                <label for="creditCard">Credit Card</label>
            </div>
            <div class="payment-option">
                <input type="radio" id="paypal" name="paymentMethod" value="PayPal">
                <label for="paypal">PayPal</label>
            </div>
            <div class="payment-option">
                <input type="radio" id="bankTransfer" name="paymentMethod" value="Bank Transfer">
                <label for="bankTransfer">Bank Transfer</label>
            </div>
            <div class="mb-3">
                <label for="amount" class="form-label">Amount to Add:</label>
                <input type="number" step="0.01" id="amount" name="amount" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    <!-- Link to Bootstrap JS from CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
