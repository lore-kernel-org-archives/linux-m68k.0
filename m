Return-Path: <SRS0=Ls/8=YX=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A632CA9EAE
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Oct 2019 01:06:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 30DB320856
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Oct 2019 01:06:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9+JYS4x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbfJ3BGh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 29 Oct 2019 21:06:37 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39576 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbfJ3BGh (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 29 Oct 2019 21:06:37 -0400
Received: by mail-pl1-f194.google.com with SMTP id t12so158405plo.6
        for <linux-m68k@vger.kernel.org>; Tue, 29 Oct 2019 18:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=fdDFuQkSyqXxYXHCi03uqRdKoO7XgVq0bc92A9W2Ypc=;
        b=h9+JYS4xbRneaqVeIwsUSVUzqPpMTl8hprv9h1GnYKDXjMsV+iljPS1fOXPVPsalB1
         D8iGkRVtQIWhXb5PvGvj9F4fxFnARS8rOYVmMpSZZpcxSk7dMj3V+I3Lz1JkO+1L5qvp
         6q6CxkccvYs0MAEwLjKbcMau7wv9zEY6gL8ZkEaf9Cby+gPsH0tN/uuJl3hs1Dtyyoue
         eYz66/MXhd7XvXAA+ek5trZq3aR/e/kZOANodskrUOs0RqEyWee8H4zjZg4AEgqEiL19
         MLF0kI/VvsKHLZ0YQQG9Q0A+H3tkR2tVO+KY4h0crq867GhNE15X9+V1Xq84KnW60UCU
         11bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=fdDFuQkSyqXxYXHCi03uqRdKoO7XgVq0bc92A9W2Ypc=;
        b=FTAwg2EXVS6aaX/ycHzooEX2gGemlmuHVppV/dSfNdirKX0QxnzXIDT78/VnxHxpVj
         wJMkfFNwilCyuh5ydCEbYnmLt6tt1vIvY5iI7n9OW/RM8kQZSaBMuCaaUZz6C+mv59GT
         StS3aTfuIdZy4Qt5KW30/OZj1HQdQ6TnTeD8mjmh4AYsU6YcEOOp5C+jTHv7jeD0TjEV
         s9X18Y3Kf1YJAMqv0JSyqBMw5oGLpLMUAEiXFJp9WHa0O49DJsv+sgd1Z2zJV4rbxzTC
         TkUJ90xCv/eHU8Ujv+qmoJDSWbMMpVqZ7UjT2tCBD71oPLXhy+O09KJkxbNB0GxGlVQk
         Pgfg==
X-Gm-Message-State: APjAAAVrhJxwPLtwnPmJs9HRPpMZmGBizxly91dEus6nD7Y5huhF/MCi
        ggCdTvCrbiFnivOno19sDGvipqtL
X-Google-Smtp-Source: APXvYqwu3H7U2ZrmUYfq3Rq7punK8P0iidu6xUEyLRIq/NiJKW6myqMpQvq7+Smo1AT2KTkqQjKarQ==
X-Received: by 2002:a17:902:74c6:: with SMTP id f6mr1689324plt.167.1572397594770;
        Tue, 29 Oct 2019 18:06:34 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:11df:7631:1f59:7f58? ([2001:df0:0:200c:11df:7631:1f59:7f58])
        by smtp.gmail.com with ESMTPSA id f8sm307970pfn.147.2019.10.29.18.06.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Oct 2019 18:06:34 -0700 (PDT)
Subject: Re: [PATCH] esp_scsi: Add support for FSC chip
To:     Finn Thain <fthain@telegraphics.com.au>,
        Kars de Jong <jongk@linux-m68k.org>
Cc:     linux-m68k@vger.kernel.org
References: <CACz-3rh9ZCyU1825yU8xxty5BGrwFhpbjKNoWnn0mGiv_h2Kag@mail.gmail.com>
 <20191029220503.7553-1-jongk@linux-m68k.org>
 <alpine.LNX.2.21.1910301109060.8@nippy.intranet>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <28fd507e-580d-97c3-1cb3-2124940f2cae@gmail.com>
Date:   Wed, 30 Oct 2019 14:06:30 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.LNX.2.21.1910301109060.8@nippy.intranet>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On 30/10/19 1:31 PM, Finn Thain wrote:
> Nice fix!
>
> As Michael mentioned already, you'll need to send this to all the relevant
> recipients:
>
> $ scripts/get_maintainer.pl add-support-for-fsc-chip.patch
> "James E.J. Bottomley" <jejb@linux.ibm.com> (maintainer:SCSI SUBSYSTEM)
> "Martin K. Petersen" <martin.petersen@oracle.com> (maintainer:SCSI SUBSYSTEM)
> linux-scsi@vger.kernel.org (open list:SCSI SUBSYSTEM)
> linux-kernel@vger.kernel.org (open list)
>
> A few more suggestions follow.
>
> On Tue, 29 Oct 2019, Kars de Jong wrote:
>
>> The FSC (NCR53CF9x-2 / SYM53CF9x-2) has a different family code than QLogic
>> or Emulex parts. This caused it to be detected as a FAS100A.
>>
>> Unforunately, this meant the configuration of the CONFIG3 register was
>> incorrect. This causes data transfer issues.
>>
>> The FSC also has a feature called Active Negation which should always be
>> enabled according to the data manual. This is done using the CONFIG4
>> register.
>>
>> Signed-off-by: Kars de Jong <jongk@linux-m68k.org>
>> ---
>>   drivers/scsi/esp_scsi.c | 10 ++++++++--
>>   drivers/scsi/esp_scsi.h | 10 ++++++----
>>   2 files changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/scsi/esp_scsi.c b/drivers/scsi/esp_scsi.c
>> index bb88995a12c7..6b34a5764de5 100644
>> --- a/drivers/scsi/esp_scsi.c
>> +++ b/drivers/scsi/esp_scsi.c
>> @@ -263,7 +263,11 @@ static void esp_reset_esp(struct esp *esp)
>>   			esp->rev = FAS236;
>>   		else if (family_code == 0x0a)
>>   			esp->rev = FASHME; /* Version is usually '5'. */
>> -		else
>> +		else if (family_code == 0x14) {
>> +			esp->rev = FSC;
>> +			/* Enable Active Negation */
>> +			esp_write8(ESP_CONFIG4_RADE, ESP_CFG4);
> There is a comment in esp_scsi.h which seems to contradict the above
> logic, "ESP config register 4 read-write, found only on am53c974 chips."
> I think the comment should be corrected now.
>
>> +		} else
>>   			esp->rev = FAS100A;
>>   		esp->min_period = ((4 * esp->ccycle) / 1000);
>>   	} else {
>> @@ -308,7 +312,8 @@ static void esp_reset_esp(struct esp *esp)
>>   
>>   	case FAS236:
>>   	case PCSCSI:
>> -		/* Fast 236, AM53c974 or HME */
>> +	case FSC:
>> +		/* Fast 236, AM53c974, FSC or HME */
>>   		esp_write8(esp->config2, ESP_CFG2);
>>   		if (esp->rev == FASHME) {
>>   			u8 cfg3 = esp->target[0].esp_config3;
>> @@ -2373,6 +2378,7 @@ static const char *esp_chip_names[] = {
>>   	"ESP100A",
>>   	"ESP236",
>>   	"FAS236",
>> +	"FSC",
>>   	"FAS100A",
>>   	"FAST",
>>   	"FASHME",
>> diff --git a/drivers/scsi/esp_scsi.h b/drivers/scsi/esp_scsi.h
>> index 91b32f2a1a1b..b60ea3e5e0eb 100644
>> --- a/drivers/scsi/esp_scsi.h
>> +++ b/drivers/scsi/esp_scsi.h
>> @@ -211,6 +211,7 @@
>>   /* ESP unique ID register read-only, found on fas236+fas100a only */
>>   #define ESP_UID_F100A         0x00     /* ESP FAS100A  */
>>   #define ESP_UID_F236          0x02     /* ESP FAS236   */
>> +#define ESP_UID_FSC           0x14     /* NCR/Symbios Logic FSC */
>>   #define ESP_UID_REV           0x07     /* ESP revision */
>>   #define ESP_UID_FAM           0xf8     /* ESP family   */
>>   
> I think these should be in numerical order.
The latter two are bitmasks, so the order makes sense to me.
>
>> @@ -262,10 +263,11 @@ enum esp_rev {
>>   	ESP100A    = 0x01,  /* NCR53C90A */
>>   	ESP236     = 0x02,
>>   	FAS236     = 0x03,
>> -	FAS100A    = 0x04,
>> -	FAST       = 0x05,
>> -	FASHME     = 0x06,
>> -	PCSCSI     = 0x07,  /* AM53c974 */
>> +	FSC        = 0x04,  /* NCR/Symbios Logic FSC */
>> +	FAS100A    = 0x05,
>> +	FAST       = 0x06,
>> +	FASHME     = 0x07,
>> +	PCSCSI     = 0x08,  /* AM53c974 */
> I'm guessing that you've placed it here because of the esp->rev >= FAS236
> tests that appear in a couple of places relating to sync transfer period.
> Might be worth mentioning that in the commit log.

Good catch. I think these tests would need to be changed to esp->rev 
 >=FSC to reflect the fact that the FSC has the same CONFIG3 settings as 
the FAS236.

Cheers,

     Michael

>
> (No idea why this list uses hexadecimal, it's not a value from a chip
> register. It would be more readable in decimal, IMHO.)
>
