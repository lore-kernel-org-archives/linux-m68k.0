Return-Path: <SRS0=Ls/8=YX=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5860DCA9EAE
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Oct 2019 00:23:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 220AF20856
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Oct 2019 00:23:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdrUcZoy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbfJ3AX1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 29 Oct 2019 20:23:27 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44115 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbfJ3AX1 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 29 Oct 2019 20:23:27 -0400
Received: by mail-pl1-f195.google.com with SMTP id q16so105775pll.11
        for <linux-m68k@vger.kernel.org>; Tue, 29 Oct 2019 17:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=t4fFwdxRVXZETW01Uwl3Qlka5iJUy/ISv4nkhIfwnw4=;
        b=YdrUcZoygAlq3zov1I+WbeSFIKqIvYDolWpqU0B3LW8DuVp1hlgtHTP/02m04QFfg4
         Jp2LYDAGq0ae9Ju/ZMmb7Qt1x3x2TgXlJv/L7ULmfV305vsY++DvL0iq+qSd9pG0ySHF
         dR4Hc99xLg7naCGUNK1jgjWerS9ZcjDM3OkjW2ntsYEtPVDtl8rX0Aau7ANYvHlr0l6a
         bbsRu9zZbq5RGjdmD/zga99WifpG2qAB11aI2/koIrDUKNudB7xCbV1LPaTyA76ZFPw5
         gsj3SUw5J78Rsw0yLg2T9Rid4453A3pS9bVo6oPqFGTJDcgoE/3bBaJobTABNUgMM+1w
         UOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=t4fFwdxRVXZETW01Uwl3Qlka5iJUy/ISv4nkhIfwnw4=;
        b=hNE2oPxdaNkAARgsv/0TFjrFoJ+EnpdkBW+wndjKte3y86PhNY8/Hb8pDathQSufP7
         K2GI6Phj1vkyX6cPDpAOI5Rg2mQA3pSkAGWB81egYmFsxWQxT1dFYgb/HflOqxQt85u5
         awljGD+B0907M2IiMv+INszAa17DzWKBmuE1XQ1V3PtT3BnUqqCWtKoPZkBsgFb63EgW
         0tvt7donqtapxE87rWWA1MsIE+KmmT7TjKpWhtvwCfHi/knw9qAUUbYsH9pG3bolYUUv
         nqEIjvkoMdfeBmv6SuBxqQczvO7k7vqiqBEjM8EQjhWj5PxwFTIXUADJxn0wR2frVSHT
         uErA==
X-Gm-Message-State: APjAAAXoCRdUtUskmwBPqRomGZu1C7gb71Kg31kgbEpSmfrPZJmUPtjI
        8uZNNJQVCWZVMVpNp8276l1C61+H
X-Google-Smtp-Source: APXvYqx+4LRPBpL8hB/GjPirnPUn/e8/Edse85tRAA+qB8w6iEPIqlEhUCg3PONzcYTmdG3nE+S1KQ==
X-Received: by 2002:a17:902:7883:: with SMTP id q3mr1425228pll.296.1572395006432;
        Tue, 29 Oct 2019 17:23:26 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:11df:7631:1f59:7f58? ([2001:df0:0:200c:11df:7631:1f59:7f58])
        by smtp.gmail.com with ESMTPSA id r185sm272149pfr.68.2019.10.29.17.23.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Oct 2019 17:23:25 -0700 (PDT)
Subject: Re: [PATCH] esp_scsi: Add support for FSC chip
To:     Kars de Jong <jongk@linux-m68k.org>, linux-m68k@vger.kernel.org
References: <CACz-3rh9ZCyU1825yU8xxty5BGrwFhpbjKNoWnn0mGiv_h2Kag@mail.gmail.com>
 <20191029220503.7553-1-jongk@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <5b7c5a95-be2d-7857-95d5-7b9030d86795@gmail.com>
Date:   Wed, 30 Oct 2019 13:23:22 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20191029220503.7553-1-jongk@linux-m68k.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Kars,

thanks for your patch. Comments inline below. Note that in order to get 
this patch integrated into the next release, you should resend it to 
linux-scsi@vger.kernel.org. The SCSI maintainers won't pick it up here.

FWIW, you are welcome to add my Reviewed-by tag (though it won't count 
for much - Finn's may carry more weight).

Cheers,

     Michael


On 30/10/19 11:05 AM, Kars de Jong wrote:
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
>   drivers/scsi/esp_scsi.c | 10 ++++++++--
>   drivers/scsi/esp_scsi.h | 10 ++++++----
>   2 files changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/scsi/esp_scsi.c b/drivers/scsi/esp_scsi.c
> index bb88995a12c7..6b34a5764de5 100644
> --- a/drivers/scsi/esp_scsi.c
> +++ b/drivers/scsi/esp_scsi.c
> @@ -263,7 +263,11 @@ static void esp_reset_esp(struct esp *esp)
>   			esp->rev = FAS236;
>   		else if (family_code == 0x0a)
>   			esp->rev = FASHME; /* Version is usually '5'. */
> -		else
> +		else if (family_code == 0x14) {
> +			esp->rev = FSC;
> +			/* Enable Active Negation */
> +			esp_write8(ESP_CONFIG4_RADE, ESP_CFG4);

Please move that into the below section ...

> +		} else
>   			esp->rev = FAS100A;
>   		esp->min_period = ((4 * esp->ccycle) / 1000);
>   	} else {
> @@ -308,7 +312,8 @@ static void esp_reset_esp(struct esp *esp)
>   
>   	case FAS236:
>   	case PCSCSI:
> -		/* Fast 236, AM53c974 or HME */
> +	case FSC:
> +		/* Fast 236, AM53c974, FSC or HME */
>   		esp_write8(esp->config2, ESP_CFG2);
>   		if (esp->rev == FASHME) {
>   			u8 cfg3 = esp->target[0].esp_config3;

... here, where chip-specific config bits are otherwise set. Just to 
keep with driver style.

Also consider whether esp->radelay can be set shorter than the default 
96 with active negation enabled (couldn't make sense of the data book on 
that point - may well be unrelated to active negation).

> @@ -2373,6 +2378,7 @@ static const char *esp_chip_names[] = {
>   	"ESP100A",
>   	"ESP236",
>   	"FAS236",
> +	"FSC",
>   	"FAS100A",
>   	"FAST",
>   	"FASHME",
> diff --git a/drivers/scsi/esp_scsi.h b/drivers/scsi/esp_scsi.h
> index 91b32f2a1a1b..b60ea3e5e0eb 100644
> --- a/drivers/scsi/esp_scsi.h
> +++ b/drivers/scsi/esp_scsi.h
> @@ -211,6 +211,7 @@
>   /* ESP unique ID register read-only, found on fas236+fas100a only */
>   #define ESP_UID_F100A         0x00     /* ESP FAS100A  */
>   #define ESP_UID_F236          0x02     /* ESP FAS236   */
> +#define ESP_UID_FSC           0x14     /* NCR/Symbios Logic FSC */
>   #define ESP_UID_REV           0x07     /* ESP revision */
>   #define ESP_UID_FAM           0xf8     /* ESP family   */
Can't find these used anywhere in the code ... I suppose they could be 
removed, or the detection code above rewritten to make use of these macros.
>   
> @@ -262,10 +263,11 @@ enum esp_rev {
>   	ESP100A    = 0x01,  /* NCR53C90A */
>   	ESP236     = 0x02,
>   	FAS236     = 0x03,
> -	FAS100A    = 0x04,
> -	FAST       = 0x05,
> -	FASHME     = 0x06,
> -	PCSCSI     = 0x07,  /* AM53c974 */
> +	FSC        = 0x04,  /* NCR/Symbios Logic FSC */
> +	FAS100A    = 0x05,
> +	FAST       = 0x06,
> +	FASHME     = 0x07,
> +	PCSCSI     = 0x08,  /* AM53c974 */
>   };
>   
>   struct esp_cmd_entry {
