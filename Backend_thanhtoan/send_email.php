<?php
// Import PHPMailer classes into the global namespace
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
use PHPMailer\PHPMailer\SMTP;

// Include the PHPMailer files
require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';

try {
    // Create an instance of PHPMailer
    $mail = new PHPMailer(true); // Pass 'true' to enable exceptions

    // Server settings
    $mail->isSMTP();                                            // Send using SMTP
    $mail->Host       = 'smtp.gmail.com';                         // Set the SMTP server to send through
    $mail->SMTPAuth   = true;                                     // Enable SMTP authentication
    $mail->Username   = 'huybom12064@gmail.com';           // SMTP username
    $mail->Password   = 'udmz kbjj lpwj mqaj';                    // SMTP password (App password)
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;              // Enable implicit TLS encryption
    $mail->Port       = 465;                                      // TCP port to connect to; use 587 for STARTTLS

    // Recipients
    $mail->setFrom('huybom12064@gail.com', 'Mailer');


    $mail->addAddress('22111060959@vci.edu.vn', 'KHÁCH '); 
    $mail->addAddress('nguyenhuyzuka@gmail.com', 'Khách');          

    // Attachments (Optional)
    // $mail->addAttachment('/var/tmp/file.tar.gz');               
    // $mail->addAttachment('/tmp/image.\\\\\\', 'new.jpg');          

 
    $mail->isHTML(true);                                          
    $mail->Subject = 'Here is the subject';
    $mail->Body    = 'Nguyễn đức huy';
   

    $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

    // Send email
    $mail->send();
    echo 'Message has been sent';

} catch (Exception $e) {
    // Catch exceptions and display the error message
    echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
}
?>
