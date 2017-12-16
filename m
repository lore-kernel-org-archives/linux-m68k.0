From: Finn Thain <fthain@telegraphics.com.au>
Subject: TCQ with zorro_esp, was Re: m68k v3.16 status update
Date: Sat, 16 Dec 2017 11:04:23 +1100 (AEDT)
Message-ID: <alpine.LNX.2.21.1712161027560.3@nippy.intranet>
References: <CAMuHMdXodxq=Z8rQAZ7UUdzUzoPfQLFCSTkJziVeAsq8MMQxmQ@mail.gmail.com> <53E48C84.9090709@gmail.com> <53E4DDF1.9060701@kopteri.net> <53E54E6C.2040806@gmail.com> <53E5C3A7.3040106@kopteri.net> <68e92278-86e7-faef-f5b2-fbc514c27464@gmail.com>
 <4403d779c1664692ae5a7ef5b69ec888@aalto.fi>,<CAOmrzkJJXZb153ig=d=Cywr59hid7X3UJvUD-wgtYtZm7KsCuQ@mail.gmail.com> <6d8ee5b744da42f296892663c57bddc9@aalto.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:42224 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755795AbdLPAEQ (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 15 Dec 2017 19:04:16 -0500
In-Reply-To: <6d8ee5b744da42f296892663c57bddc9@aalto.fi>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Vainikka Tuomas <tuomas.vainikka@aalto.fi>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>

On Fri, 15 Dec 2017, Vainikka Tuomas wrote:

> Hello,
> 
> Just bear in mind that there was no need for the PIO transfers when the 
> TCQ was hacked off. Commands over DMA worked fine then at least on my 
> Blizzard SCSI-IV...

Inhibiting TCQ also affects performance.

If you want to, you can measure the difference (compared to Michael's 
patch) by using a patch like the one below, with the option 
esp_scsi.esp_no_tcq=1.

The use of PIO for short transfers should cost nothing in the absence of 
TCQ because there should be no short tranfers.

-- 

> 
> -Tuomas
> 

diff --git a/drivers/scsi/esp_scsi.c b/drivers/scsi/esp_scsi.c
index c3fc34b9964d..69c3de96b79c 100644
--- a/drivers/scsi/esp_scsi.c
+++ b/drivers/scsi/esp_scsi.c
@@ -37,6 +37,8 @@
 /* SCSI bus reset settle time in seconds.  */
 static int esp_bus_reset_settle = 3;
 
+static int esp_no_tcq = -1;
+
 static u32 esp_debug;
 #define ESP_DEBUG_INTR		0x00000001
 #define ESP_DEBUG_SCSICMD	0x00000002
@@ -698,7 +700,7 @@ static struct esp_cmd_entry *find_and_prep_issuable_command(struct esp *esp)
 			return ent;
 		}
 
-		if (!spi_populate_tag_msg(&ent->tag[0], cmd)) {
+		if (esp_no_tcq > 0 || !spi_populate_tag_msg(&ent->tag[0], cmd)) {
 			ent->tag[0] = 0;
 			ent->tag[1] = 0;
 		}
@@ -2476,7 +2478,7 @@ static int esp_slave_configure(struct scsi_device *dev)
 	struct esp *esp = shost_priv(dev->host);
 	struct esp_target_data *tp = &esp->target[dev->id];
 
-	if (dev->tagged_supported)
+	if (esp_no_tcq <= 0 && dev->tagged_supported)
 		scsi_change_queue_depth(dev, esp->num_tags);
 
 	tp->flags |= ESP_TGT_DISCONNECT;
@@ -2768,6 +2770,9 @@ MODULE_AUTHOR("David S. Miller (davem@davemloft.net)");
 MODULE_LICENSE("GPL");
 MODULE_VERSION(DRV_VERSION);
 
+module_param(esp_no_tcq, int, 0);
+MODULE_PARM_DESC(esp_no_tcq, "Send no command tags");
+
 module_param(esp_bus_reset_settle, int, 0);
 MODULE_PARM_DESC(esp_bus_reset_settle,
 		 "ESP scsi bus reset delay in seconds");
