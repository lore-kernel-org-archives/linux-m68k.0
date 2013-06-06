From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 0/2] Experimental Amiga Zorro ESP driver
Date: Fri,  7 Jun 2013 08:56:37 +1200
Message-ID: <1370552199-15048-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:65370 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753197Ab3FFU4x (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 6 Jun 2013 16:56:53 -0400
Received: by mail-pd0-f176.google.com with SMTP id r11so3850552pdi.21
        for <linux-m68k@vger.kernel.org>; Thu, 06 Jun 2013 13:56:52 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org

Geert,

other than 'it compiles', I can't really say much about this one. 
I've done what seemed necessary to do the ESP probe setup in the
zorro driver framework (using the NCR7xx driver as a guideline),  
and used the old Blizzard 2060 driver as a model for the DMA setup. 

To adapt to another style of ESP integration, the DMA setup function   
will need to be changed. The simplest way to cater for multipe boards    
in this driver may be to provide a separate DMA setup function for   
each, and substitute the correct one for the default esp_ops field in
the driver probe. Please correct me if you see a better or simpler way.

Posting to the list in the hope that someone will be able to compile
and test this. I will be increasingly busy at work over the next      
months, and may not have much opportunity to work on this until        
October. Ingo had offered a setup for remote debugging and testing,
but I've been slow to get started on that, and the machine now moves 
to FU Berlin if I understood right. 

Cheers,

        Michael

[PATCH 1/2] m68k/amiga - Zorro ESP SCSI Makefile/Kconfig support
[PATCH 2/2] m68k/amiga - Zorro ESP: convert old driver to ESP core
