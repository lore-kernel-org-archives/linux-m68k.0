From: Angelo Dureghello <angelo@sysam.it>
Subject: [RFC] ColdFire mcf5441x eDMA driver
Date: Tue, 26 Dec 2017 19:32:13 +0100
Message-ID: <20171226183212.GA6375@jerusalem>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ec2-18-194-220-216.eu-central-1.compute.amazonaws.com ([18.194.220.216]:43524
        "EHLO sysam.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750822AbdLZScQ (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Tue, 26 Dec 2017 13:32:16 -0500
Received: from localhost (localhost [127.0.0.1])
        by sysam.it (Postfix) with ESMTP id 38A70202CB
        for <linux-m68k@vger.kernel.org>; Tue, 26 Dec 2017 18:32:15 +0000 (UTC)
Received: from sysam.it ([127.0.0.1])
        by localhost (sysam.it [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id HiBR5enMwMm0 for <linux-m68k@vger.kernel.org>;
        Tue, 26 Dec 2017 18:32:14 +0000 (UTC)
Received: from jerusalem (host14-171-dynamic.50-82-r.retail.telecomitalia.it [82.50.171.14])
        by sysam.it (Postfix) with ESMTPSA id 22170202C5
        for <linux-m68k@vger.kernel.org>; Tue, 26 Dec 2017 18:32:14 +0000 (UTC)
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Hi all,

was looking inside mcf54415 eDMA support, and just seen that the available 
fsl-edma.c driver is not suitable for this CPU. The hw module is quite similar
but register positions and channels available are different.

So, seems a good chance to add a mcf-edma.c driver, starting/looking from 
fsl-edma.c. What do you think ? Is there anything already done about, maybe ?
In case i would like to try to write an initial version of this driver.

And Merry Christmas time to all.

Regards,
Angelo Dureghello
