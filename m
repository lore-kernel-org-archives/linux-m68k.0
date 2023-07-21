Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2FB0EB64DA
	for <linux-m68k@archiver.kernel.org>; Fri, 21 Jul 2023 01:13:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjGUBNT (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 20 Jul 2023 21:13:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjGUBNS (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 20 Jul 2023 21:13:18 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ED9430DA
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Jul 2023 18:12:54 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2632336f75fso816726a91.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Jul 2023 18:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689901973; x=1690506773;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zj9BN6XQ2BhpI5RRKOKT0ShpHf7qrsi8i26dVieNwzQ=;
        b=AqWz4VOFcuLayevpS/Dt+RbbDDrcxj/X7kla7lvA9Fn/8jkuoEIOxucXD/cxYk4gNU
         SWlyNl56nRDhizjspfFEaDs1foWH8LARsbiCKSQQkbRay2wUWOVUdxBBx+5qG93wLeQ8
         cy66ZA6A+JhKC/h8lOb7reHFUagEE5FH7srE+lgSynSrpzf4nsewocXkMTlyM8joOdz3
         sxYPDDDrkyF3F6gokLSfXR5O8OJ/OolOP/4q9lGBoyeVgEJ8Y9FGBfU8dgbLqRNzXbH0
         at7A04L1B4oe8BIDStBfRlR9a5z9c1NTDTT+7G/K4xmZe6WlraWSU/fiDH00A25LN6Zt
         avzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689901973; x=1690506773;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zj9BN6XQ2BhpI5RRKOKT0ShpHf7qrsi8i26dVieNwzQ=;
        b=VLtiEMwFOxk+VBGQ7EgX3DGzV9pvvWfokrOydhn9kvqru1sYxoOs+A4/3/7CP715n3
         9OS7ybgbe5MTsgqeA8Wza4M2myhU1zd9lXJI0tDtrLFLjC6JTkw2+wiSMTnTUM4Jszzo
         9r5BiZ6vVtS+JlZgMQoL0cUjkTmGxau1+gOXFALUySvJFRW/PQCPNN6JQmY+tsc3lG7W
         QbXuC/Vw2epoHERcIUtQFIZzstzjIJ7Kvnu6MvxxFVj+TX+M21qr2tQSKtOSyqmKnHXb
         NkK1VboLgkYfAKryejwvQAP7yoGciqoBYIBFqO/4nGPTDLv6dbnMxX+OyGv0yCv92ba4
         BfSA==
X-Gm-Message-State: ABy/qLZwYeRqYv3n3AEEsqzw2yXtvI7UEezxWvisVPvDvCVAMOj2RyBE
        dm7wT3DgsRPLUhNS+fEF9iO+pp5oCDg=
X-Google-Smtp-Source: APBJJlGbrzdSTQt3ZAjJJfHVKZP7iE7Jteb6XrOZSZ6v2x+PEqZ4PH6T0mU192M434iS2h/BFI9pGg==
X-Received: by 2002:a17:90b:1b47:b0:263:6114:f0f9 with SMTP id nv7-20020a17090b1b4700b002636114f0f9mr269035pjb.42.1689901973482;
        Thu, 20 Jul 2023 18:12:53 -0700 (PDT)
Received: from [10.1.1.24] (222-152-184-54-fibre.sparkbb.co.nz. [222.152.184.54])
        by smtp.gmail.com with ESMTPSA id y13-20020a17090aca8d00b00263b4b1255esm3127770pjt.51.2023.07.20.18.12.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jul 2023 18:12:53 -0700 (PDT)
Subject: Re: clear_bit_unlock_is_negative_byte
To:     Matthew Wilcox <willy@infradead.org>,
        linux-m68k@lists.linux-m68k.org
References: <ZLmKq2VLjYGBVhMI@casper.infradead.org>
 <25b10d04-c6bf-8583-ee0d-84bf647ef0af@gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <5e3a36d1-13f0-9cc3-de44-cc045025b290@gmail.com>
Date:   Fri, 21 Jul 2023 13:12:48 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <25b10d04-c6bf-8583-ee0d-84bf647ef0af@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Matthew,

Am 21.07.2023 um 10:37 schrieb Michael Schmitz:
> Hi Matthew,
>
> Am 21.07.2023 um 07:27 schrieb Matthew Wilcox:
>> I'm looking to implement clear_bit_unlock_is_negative_byte() on every
>> architecture so we can delete the ifdeffery around maybe-we-have-it
>> and remove the simple implementation from filemap.c.  Here's what I've
>> come up with for m68k:
>>
>> +static inline bool clear_bit_unlock_is_negative_byte(unsigned int nr,
>> +               volatile unsigned long *p)
>> +{
>> +       char result;
>> +       char mask = 1 << nr;    /* nr guaranteed to be < 7 */
>> +
>> +       __asm__ __volatile__ ("eori %1, %2; smi %0"
>> +               : "=d" (result)
>> +               : "i" (mask), "o" (*p)
>> +               : "memory");
>> +       return result;
>> +}
>>
>> It compiles, so I feel Very Pleased With Myself, since I haven't written
>> m68k assmbly in 25 years.  But I have questions.
>
> Unfortunately, after plugging this in, the boot hangs at the first block
> device encountered:
>
> calling  proc_hardware_init+0x0/0x20 @ 1
> initcall proc_hardware_init+0x0/0x20 returned 0 after 40 usecs
> calling  rtc_init+0x0/0x5e @ 1
> initcall rtc_init+0x0/0x5e returned 0 after 40 usecs
> calling  atari_nvram_init+0x0/0x42 @ 1
> initcall atari_nvram_init+0x0/0x42 returned 0 after 40 usecs
> calling  nfhd_init+0x0/0x206 @ 1
> nfhd8: found device with 20971440 blocks (512 bytes)
>
> Doesn't eat up memory, doesn't sit in a tight spin, just never proceeds
> past that point.
>
> Running old and new code side by side (well, actually sequentially) in
> clear_bit_unlock_is_negative_byte()  and comparing results, the return
> values generated by both options match but the actual contents of the
> pointer passed to the function (after the mods) does differ:
>
> nfhd8: found device with 20971440 blocks (512 bytes)
> cbu_inb memval mismatch: 2004 12005
> cbu_inb memval mismatch: 2004 12005
>  nfhd8: AHDI p1 p2
> cbu_inb memval mismatch: 26 10027
> cbu_inb memval mismatch: 26 10027
>
> (first value is from the old code, second value from the new code).

Logging the bit nr. and value passed in:

nfhd8: found device with 20971440 blocks (512 bytes)
cbu_inb memval mismatch: 2004 12005 2005 0
cbu_inb memval mismatch: 2004 12005 2005 0
  nfhd8: AHDI p1 p2
cbu_inb memval mismatch: 36 10037 37 0
cbu_inb memval mismatch: 36 10037 37 0

Plenty more later in the boot:
calling  brd_init+0x0/0xca @ 1
cbu_inb memval mismatch: 2004 12005 2005 0
cbu_inb memval mismatch: 2004 12005 2005 0
cbu_inb memval mismatch: 26 10027 27 0
cbu_inb memval mismatch: 26 10027 27 0
cbu_inb memval mismatch: 2004 12005 2005 0
cbu_inb memval mismatch: 2004 12005 2005 0
cbu_inb memval mismatch: 36 10037 37 0
cbu_inb memval mismatch: 36 10037 37 0
cbu_inb memval mismatch: 2004 12005 2005 0
cbu_inb memval mismatch: 2004 12005 2005 0
cbu_inb memval mismatch: 36 10037 37 0
cbu_inb memval mismatch: 36 10037 37 0
cbu_inb memval mismatch: 2004 12005 2005 0
cbu_inb memval mismatch: 2004 12005 2005 0
cbu_inb memval mismatch: 26 10027 27 0
cbu_inb memval mismatch: 26 10027 27 0
cbu_inb memval mismatch: 2004 12005 2005 0
cbu_inb memval mismatch: 2004 12005 2005 0
cbu_inb memval mismatch: 36 10037 37 0
cbu_inb memval mismatch: 36 10037 37 0
cbu_inb memval mismatch: 2004 12005 2005 0
cbu_inb memval mismatch: 2004 12005 2005 0
cbu_inb memval mismatch: 26 10027 27 0
cbu_inb memval mismatch: 26 10027 27 0
cbu_inb memval mismatch: 2004 12005 2005 0
cbu_inb memval mismatch: 2004 12005 2005 0
cbu_inb memval mismatch: 26 10027 27 0
cbu_inb memval mismatch: 26 10027 27 0
cbu_inb memval mismatch: 2004 12005 2005 0
cbu_inb memval mismatch: 2004 12005 2005 0

>
> It looks to me that the eori operates on a 16 bit word here?

And it's bits 32-17 of the longword.

The instruction you need is eori.b, and you'll have to increase the mem 
pointer by 3 bytes. With that change, I see no further mismatches until 
the return values begin to differ once disk access begins:

sd 0:0:1:0: [sdb] Preferred minimum I/O size 512 bytes
cbu_inb retval mismatch: 1 ff 2084 2084 2085 0
rtc-generic rtc-generic: registered as rtc0
cbu_inb retval mismatch: 1 ff 2094 2094 2095 0
...
sd 0:0:0:0: [sda] Attached SCSI disk
probe of 0:0:0:0 returned 0 after 58395182 usecs
cbu_inb retval mismatch: 1 ff 2094 2094 2095 0
  sdb: RDSK (512) sdb1 (DOS^G)(res 2 spb 2) sdb2 (SFS^B)(res 2 spb 1) 
sdb3 (SFS^B)(res 2 spb 2) sdb4 ((res 2 spb 1)
sdb: p4 size 18446744071971831216 extends beyond EOD, enabling native 
capacity
cbu_inb retval mismatch: 1 ff 2084 2084 2085 0

(return value from old and new code, value of mem from old and new code, 
original value, bit nr).

Bit 7 was already set before xor, and wasn't cleared. I suspect that's 
why the return value is no longer 1?

Time to dig out that 68k programmer's manual...

Cheers,

	Michael


>
> (Disclaimer: I have written m68k assembly occasionally in the past
> years, but I struggle with inline asm...)
>
> Cheers,
>
>     Michael
>
>>
>> First, m68k is big-endian, so I suspect I'm accessing the wrong byte.
>> Should something in there be adding 3 to 'p'?  Better to do it in the
>> asm, or in the constraints so the compiler can see it?
>>
>> Second, have I properly communicated to the assembler that this is
>> a byte-size operation, and it needs to check bit 7 and not bits 15 or 31
>> to set the negative flag?
>>
>> Third, can this be done better?  x86 has __GCC_ASM_FLAG_OUTPUTS__
>> so it doesn't need the equivalent of the SMI instruction to move the
>> condition to an output variable; it can just tell the compiler that
>> the N flag communicates the result that it's looking for.  Does m68k
>> have __GCC_ASM_FLAG_OUTPUTS__ or did nobody do that work yet?
>>
>> Fourth, we could do this is with ANDI instead of EORI.  It's mildly
>> safer, but we really shouldn't have two threads clearing the lock bit
>> that race with each other.  We can't do it with BCLR because that
>> doesn't set the N flag.  If we do that, we'd need to invert the mask.
>>
>> Appreciate your time looking at this.
>>
