Return-Path: <SRS0=Ls/8=YX=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4629BCA9EAE
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Oct 2019 00:31:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1597C20866
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Oct 2019 00:31:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbfJ3Abj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 29 Oct 2019 20:31:39 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:53738 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbfJ3Abj (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 29 Oct 2019 20:31:39 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id 7282E29B15;
        Tue, 29 Oct 2019 20:31:36 -0400 (EDT)
Date:   Wed, 30 Oct 2019 11:31:34 +1100 (AEDT)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Kars de Jong <jongk@linux-m68k.org>
cc:     linux-m68k@vger.kernel.org, Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH] esp_scsi: Add support for FSC chip
In-Reply-To: <20191029220503.7553-1-jongk@linux-m68k.org>
Message-ID: <alpine.LNX.2.21.1910301109060.8@nippy.intranet>
References: <CACz-3rh9ZCyU1825yU8xxty5BGrwFhpbjKNoWnn0mGiv_h2Kag@mail.gmail.com> <20191029220503.7553-1-jongk@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


Nice fix!

As Michael mentioned already, you'll need to send this to all the relevant 
recipients:

$ scripts/get_maintainer.pl add-support-for-fsc-chip.patch
"James E.J. Bottomley" <jejb@linux.ibm.com> (maintainer:SCSI SUBSYSTEM)
"Martin K. Petersen" <martin.petersen@oracle.com> (maintainer:SCSI SUBSYSTEM)
linux-scsi@vger.kernel.org (open list:SCSI SUBSYSTEM)
linux-kernel@vger.kernel.org (open list)

A few more suggestions follow.

On Tue, 29 Oct 2019, Kars de Jong wrote:

> The FSC (NCR53CF9x-2 / SYM53CF9x-2) has a different family code than QLogic
> or Emulex parts. This caused it to be detected as a FAS100A.
> 
> Unforunately, this meant the configuration of the CONFIG3 register was
> incorrect. This causes data transfer issues.
> 
> The FSC also has a feature called Active Negation which should always be
> enabled according to the data manual. This is done using the CONFIG4
> register.
> 
> Signed-off-by: Kars de Jong <jongk@linux-m68k.org>
> ---
>  drivers/scsi/esp_scsi.c | 10 ++++++++--
>  drivers/scsi/esp_scsi.h | 10 ++++++----
>  2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/scsi/esp_scsi.c b/drivers/scsi/esp_scsi.c
> index bb88995a12c7..6b34a5764de5 100644
> --- a/drivers/scsi/esp_scsi.c
> +++ b/drivers/scsi/esp_scsi.c
> @@ -263,7 +263,11 @@ static void esp_reset_esp(struct esp *esp)
>  			esp->rev = FAS236;
>  		else if (family_code == 0x0a)
>  			esp->rev = FASHME; /* Version is usually '5'. */
> -		else
> +		else if (family_code == 0x14) {
> +			esp->rev = FSC;
> +			/* Enable Active Negation */
> +			esp_write8(ESP_CONFIG4_RADE, ESP_CFG4);

There is a comment in esp_scsi.h which seems to contradict the above 
logic, "ESP config register 4 read-write, found only on am53c974 chips."
I think the comment should be corrected now.

> +		} else
>  			esp->rev = FAS100A;
>  		esp->min_period = ((4 * esp->ccycle) / 1000);
>  	} else {
> @@ -308,7 +312,8 @@ static void esp_reset_esp(struct esp *esp)
>  
>  	case FAS236:
>  	case PCSCSI:
> -		/* Fast 236, AM53c974 or HME */
> +	case FSC:
> +		/* Fast 236, AM53c974, FSC or HME */
>  		esp_write8(esp->config2, ESP_CFG2);
>  		if (esp->rev == FASHME) {
>  			u8 cfg3 = esp->target[0].esp_config3;
> @@ -2373,6 +2378,7 @@ static const char *esp_chip_names[] = {
>  	"ESP100A",
>  	"ESP236",
>  	"FAS236",
> +	"FSC",
>  	"FAS100A",
>  	"FAST",
>  	"FASHME",
> diff --git a/drivers/scsi/esp_scsi.h b/drivers/scsi/esp_scsi.h
> index 91b32f2a1a1b..b60ea3e5e0eb 100644
> --- a/drivers/scsi/esp_scsi.h
> +++ b/drivers/scsi/esp_scsi.h
> @@ -211,6 +211,7 @@
>  /* ESP unique ID register read-only, found on fas236+fas100a only */
>  #define ESP_UID_F100A         0x00     /* ESP FAS100A  */
>  #define ESP_UID_F236          0x02     /* ESP FAS236   */
> +#define ESP_UID_FSC           0x14     /* NCR/Symbios Logic FSC */
>  #define ESP_UID_REV           0x07     /* ESP revision */
>  #define ESP_UID_FAM           0xf8     /* ESP family   */
>  

I think these should be in numerical order.

> @@ -262,10 +263,11 @@ enum esp_rev {
>  	ESP100A    = 0x01,  /* NCR53C90A */
>  	ESP236     = 0x02,
>  	FAS236     = 0x03,
> -	FAS100A    = 0x04,
> -	FAST       = 0x05,
> -	FASHME     = 0x06,
> -	PCSCSI     = 0x07,  /* AM53c974 */
> +	FSC        = 0x04,  /* NCR/Symbios Logic FSC */
> +	FAS100A    = 0x05,
> +	FAST       = 0x06,
> +	FASHME     = 0x07,
> +	PCSCSI     = 0x08,  /* AM53c974 */

I'm guessing that you've placed it here because of the esp->rev >= FAS236 
tests that appear in a couple of places relating to sync transfer period. 
Might be worth mentioning that in the commit log.

(No idea why this list uses hexadecimal, it's not a value from a chip 
register. It would be more readable in decimal, IMHO.)

-- 

>  };
>  
>  struct esp_cmd_entry {
> 
