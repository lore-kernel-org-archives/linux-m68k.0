Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC9AEB64DD
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Aug 2023 11:19:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234232AbjHNLTF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Aug 2023 07:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234299AbjHNLSv (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Aug 2023 07:18:51 -0400
Received: from mail.sowerbutts.com (mail.sowerbutts.com [IPv6:2001:8b0:3b1:dead::100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AFBEFA
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Aug 2023 04:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sowerbutts.com; s=igor; h=In-Reply-To:Content-Type:MIME-Version:References:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=8JXrAJHQ+J6O4ipP6/OfbdgdZttPjGJ0B7oY8XM5WiU=; b=pK4jAfXQ0ziw7ZB73ZdgeKfgAA
        chvgHa7AlbuyjdZ/jN6Rqo0Eo0bJ/tjj32fi9fmbKI4ty56xFtTeqngQAaPy66c9FY3UrMuuEVtFn
        W+fuNYxgvgMMM7O4vhYl0hGau8LkjSA8rsxKeMzh5fI5jMAtDmMfPCOm0Z+2y+GzfBRNVpYr7f+wp
        d/DCkjAVpwe0yyg6z6WdEgQpX1mZ3w4VR55rNMz6i9k0I+0LFCRFPjo10bhrRaDU1okJyJK8YQ1+k
        W8rvpzX7anKv74GtdY0fmFaQzd0HrhsM1IoLmZ6DT2K8o6eTWRwvvJDyk0LE2oyrB9oNbTX59pAW1
        JTKkvMng==;
Received: from [2001:8b0:3b1:cafe:2292:e7dd:dea3:4ff6] (helo=sowerbutts.com)
        by mail.sowerbutts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <will@sowerbutts.com>)
        id 1qVVau-000Ihu-21;
        Mon, 14 Aug 2023 12:18:44 +0100
Date:   Mon, 14 Aug 2023 12:18:44 +0100
From:   William R Sowerbutts <will@sowerbutts.com>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Finn Thain <fthain@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Richard Zidlicky <rz@linux-m68k.org>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
Message-ID: <ZNoNlC5fhztMFBAk@sowerbutts.com>
References: <d01db1e6-a0ae-559c-ab64-b3a2f5b60324@gmail.com>
 <997f0ff1-865d-29fb-ef65-2bb693549da8@linux-m68k.org>
 <288847c5-46bd-fcd4-11a7-829685a02c79@gmail.com>
 <521776cc-a11e-0a3a-b44d-fc051f6ee2ea@linux-m68k.org>
 <624c5629-e337-46ba-c8ac-411fe19f2f46@gmail.com>
 <81706cdc-2a7a-f383-881a-7313fefbb938@linux-m68k.org>
 <68187ca1-1d4f-92f9-f6c7-476caaa24df0@gmail.com>
 <275c3e98-a8e3-5d2a-13fa-db79ab9d6719@linux-m68k.org>
 <ZNlYFCVubNgzmUfc@sowerbutts.com>
 <c8fd631b-226c-4c60-884b-2ffa6437d03f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="hP0EdSY5phCdo9Tv"
Content-Disposition: inline
In-Reply-To: <c8fd631b-226c-4c60-884b-2ffa6437d03f@gmail.com>
X-URL:  http://sowerbutts.com/
X-Hatstand: Voltron
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


--hP0EdSY5phCdo9Tv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 14, 2023 at 10:54:54AM +1200, Michael Schmitz wrote:
>On 14/08/23 10:24, William R Sowerbutts wrote:
>> * 6.4.10 + Michael's RFC patch -- IDE fails (no crash, but "Bad IO 
>> access")
>
>That might be fixed by my second RFC patch, just gone out today.

6.4.10 + your "RFC v2" patch boots without the "Bad IO access" errors!

Your patch looks correct to me.

>This one still byte-swaps the data from disk though. I understood that was
>always the case for Q40, but I may have been mistaken there.

It is indeed returning byte-swapped data.  This is easily fixed, I'm using
the attached patch.

>> For my 6.4 patch I enabled byte swapping in the pata_falcon_data_xfer()
>> function -- this allows me to use an IDE drive with everything in the
>> normal/compatible byte ordering, which makes life much easier. I assume this
>> is the intended behaviour.
>That would be the sane behaviour, but the designers of both the Falcon and
>apparently the TiVo decided otherwise, wired up the IDE data bus byte-swapped
>and saved the byteswap operations in the driver. I'm unsure how this was
>intended to work on Q40.

The Q40 does NOT have hardware to reverse the byte-swapping.  The CPU has to 
byte-swap data if you want to use disks with standard/compatible data.

>Now the question is how data on legacy Q40 IDE disks have been stored. If
>it's byte-swapped, we'd better keep that byte order in the current driver
>(meaning your changes to pata_falcon_data_xfer() won't be needed, but you
>would have to swap back data on your disk). If it's always been in PC
>compatible byte order, all data (not just the identify data) must be swapped.
>
>I'd like to have Richard's opinion on this (or hear from any other former Q40
>user).

I have learned that the "standard" firmware for the Q40, SMSQ/E, does not 
byte-swap data (it also uses an obscure partition scheme and filesystem).

Personally, I am strongly in favour of Linux on the Q40 using standard 
byte-order disks that are compatible with other machines. This feels like the 
right thing to do and it is what I think most users would expect.

Users (if there are any!) with legacy byte-swapped disks can always use the 
standard tools to byte swap them into the correct, compatible format.

Thanks

Will

_________________________________________________________________________
William R Sowerbutts                                  will@sowerbutts.com
"Carpe post meridiem"                               http://sowerbutts.com
         main(){char*s=">#=0> ^#X@#@^7=",c=0,m;for(;c<15;c++)for
         (m=-1;m<7;putchar(m++/6&c%3/2?10:s[c]-31&1<<m?42:32));}  


--hP0EdSY5phCdo9Tv
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="pata_falcon-q40-byteswap.patch"

--- linux-6.4.10+michael-rfc2/drivers/ata/pata_falcon.c.orig	2023-08-14 11:21:48.636681174 +0100
+++ linux-6.4.10+michael-rfc2/drivers/ata/pata_falcon.c	2023-08-14 11:34:17.244301035 +0100
@@ -48,7 +48,7 @@
 	struct scsi_cmnd *cmd = qc->scsicmd;
 	bool swap = 1;
 
-	if (dev->class == ATA_DEV_ATA && cmd &&
+	if (!MACH_IS_Q40 && dev->class == ATA_DEV_ATA && cmd &&
 	    !blk_rq_is_passthrough(scsi_cmd_to_rq(cmd)))
 		swap = 0;
 

--hP0EdSY5phCdo9Tv--
