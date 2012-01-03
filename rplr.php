<?php
    // now greet the sender
    header("content-type: text/xml");
    echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
?>
<Response>
    <Sms>Thanks for sending a message to Chase's SMS Bot! But you should txt Chase at his cell phone number.</Sms>
</Response>