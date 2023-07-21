Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4DC9EB64DA
	for <linux-m68k@archiver.kernel.org>; Fri, 21 Jul 2023 01:43:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbjGUBnP (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 20 Jul 2023 21:43:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjGUBnP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 20 Jul 2023 21:43:15 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0E762106
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Jul 2023 18:43:13 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-55b5a3915f5so807283a12.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Jul 2023 18:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689903793; x=1690508593;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLpdYs62YPlvdkzveHL+cV5fQAOutjcOKDk14R5TjsQ=;
        b=NQbmks3wON/oRqZBaB0K2fDEBwgYmqf5XRUI2ZTnjxPFR8vgjE8PbBZAcTZBtCs/Xz
         37fcfBymW41NzPx95GDnQKIEi6Bm4Q/xWYdJP6l7RNoh4vu7YkhyNImnobbSx+XM5y9S
         +qTQqucLpS18jcOY0Bt4P8X0+T2cUeF3NM8a6ymJcAZSZ0QcO+szsvU7ZpofREE6HGVu
         Nc3zwCPboKMZ41AuTKVmjPbyyX9lKtzgBBMESVElenORIB1NkcRH7ziPs6327sKZbz/a
         o6C3iPVL4mL+CSgy8N1zgVAq2zSpMgs+a96zSbkS+cXf4V1M9bOcsjJ+3tLMfn4UQU0E
         vIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689903793; x=1690508593;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oLpdYs62YPlvdkzveHL+cV5fQAOutjcOKDk14R5TjsQ=;
        b=YGK8QzpH1fn7QJ51IZcUE+aRetusb3DU6OKqxbuu4W7N3ZYo+xz/fnTyobdyI3f9oM
         bPDtvnCGp4XuLL2pLMJm+BJLtZRHpMCW/WON7IwQM9TLX4CHN8uvsXbRSLapP3cmcpCp
         aJkKNpxzyGKlvYOCNoVohtVt+5lgj2wbxKwnHxnd0C7pyTHu9Jap3z/uvjguf2WoiFuA
         n0R85CwuhDtczS2RtFwisaVEgihBmX/33xiTFFds2jQX/+ZnqWabgJkZVSf/xoJGR2bk
         yxhmxdVDgr9Ks7IziAbdh6DVDZeUiWIjQU68c1Idn14ipqARQPRDHM0HM+DwIK/wd96c
         uU/A==
X-Gm-Message-State: ABy/qLYmx014tW7mGdBu6gw25XKCzSCRKrem0XYcGBAZJ8OtcOKfTBcl
        lqQhGYNHwnbJgglhWVljuCNyts9cavc=
X-Google-Smtp-Source: APBJJlFx8gWWwnwU+SuyPP+kSR99FWSPHqhw2K57N05E1lCSflpqxqw5oLKdCd1qwlBkNJM0ELO7/A==
X-Received: by 2002:a05:6a21:99a5:b0:126:9081:2156 with SMTP id ve37-20020a056a2199a500b0012690812156mr621755pzb.4.1689903792671;
        Thu, 20 Jul 2023 18:43:12 -0700 (PDT)
Received: from [10.1.1.24] (222-152-184-54-fibre.sparkbb.co.nz. [222.152.184.54])
        by smtp.gmail.com with ESMTPSA id jb1-20020a170903258100b001b9e8e833f3sm2083193plb.61.2023.07.20.18.43.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jul 2023 18:43:12 -0700 (PDT)
Subject: Re: clear_bit_unlock_is_negative_byte
To:     Matthew Wilcox <willy@infradead.org>
References: <ZLmKq2VLjYGBVhMI@casper.infradead.org>
 <25b10d04-c6bf-8583-ee0d-84bf647ef0af@gmail.com>
 <5e3a36d1-13f0-9cc3-de44-cc045025b290@gmail.com>
 <ZLngEXDdrAKSw+90@casper.infradead.org>
Cc:     linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <2e4c5eda-671e-9fc8-17fc-7f4b894ef653@gmail.com>
Date:   Fri, 21 Jul 2023 13:43:06 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <ZLngEXDdrAKSw+90@casper.infradead.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Matthew,

Am 21.07.2023 um 13:32 schrieb Matthew Wilcox:
> On Fri, Jul 21, 2023 at 01:12:48PM +1200, Michael Schmitz wrote:
>> Logging the bit nr. and value passed in:
>>
>> nfhd8: found device with 20971440 blocks (512 bytes)
>> cbu_inb memval mismatch: 2004 12005 2005 0
>> cbu_inb memval mismatch: 2004 12005 2005 0
>>  nfhd8: AHDI p1 p2
>> cbu_inb memval mismatch: 36 10037 37 0
>> cbu_inb memval mismatch: 36 10037 37 0
>
> I'm not quite sure what values you're printing here?  And whether
> they're hex or decimal.  Could you show me the printk string?

All hex, except the last (nr). Values are mem (as modified by the 
original code), copy of mem (as modified by inline asm), the original 
value of mem, and nr.

>
>> The instruction you need is eori.b, and you'll have to increase the mem
>> pointer by 3 bytes. With that change, I see no further mismatches until the
>> return values begin to differ once disk access begins:
>
> Ah thanks.  The perils of working from Motorola official docs and then
> trying to use the GNU assembler ...
>
>> sd 0:0:1:0: [sdb] Preferred minimum I/O size 512 bytes
>> cbu_inb retval mismatch: 1 ff 2084 2084 2085 0
>> rtc-generic rtc-generic: registered as rtc0
>> cbu_inb retval mismatch: 1 ff 2094 2094 2095 0
>> ...
>> sd 0:0:0:0: [sda] Attached SCSI disk
>> probe of 0:0:0:0 returned 0 after 58395182 usecs
>> cbu_inb retval mismatch: 1 ff 2094 2094 2095 0
>>  sdb: RDSK (512) sdb1 (DOS^G)(res 2 spb 2) sdb2 (SFS^B)(res 2 spb 1) sdb3
>> (SFS^B)(res 2 spb 2) sdb4 ((res 2 spb 1)
>> sdb: p4 size 18446744071971831216 extends beyond EOD, enabling native
>> capacity
>> cbu_inb retval mismatch: 1 ff 2084 2084 2085 0
>>
>> (return value from old and new code, value of mem from old and new code,
>> original value, bit nr).
>
> OK, so the new code would set the byte to 0xff (that's how Sxx works).
> But it's returning a bool, so that shouldn't matter.  2084/2084/2085
> would make sense; one of the two functions has cleared the bottom bit.
>
>> Bit 7 was already set before xor, and wasn't cleared. I suspect that's why
>> the return value is no longer 1?
>
> Ah, it's not supposed to be cleared.  The way this works is that bit 0
> is the lock bit; if someone's waiting on the folio, they set bit 7.  If
> bit 7 is set when we clear bit 0, we look on the wait queue.  If there's
> nobody on the wait queue, we clear bit 7.

Right, that's what I meant to say. I'd only seen cases where bit 0 had 
been set and was cleared. This isn't an actual production system of 
sorts, just an ARAnyM instance I can fire up quickly to see patched 
kernels crash horribly.

>
> So ... I think you've fixed it!

This is what I have tests running on right now:

static inline bool clear_bit_unlock_is_negative_byte(unsigned int nr,
                 volatile unsigned long *p)
{
         unsigned char *cp = (unsigned char *) p;
         char result;
         char mask = 1 << nr;    /* nr guaranteed to be < 7 */

         __asm__ __volatile__ ("eori.b %1, %2; smi %0"
                 : "=d" (result)
                 : "i" (mask), "o" (*(cp+3))
                 : "memory");
         return result;
}

I'm sure you can do all the casting to char and increment by 3 in the 
asm argument...

If there's a simple way to exercise this code path using standard Unix 
tools (or stress-ng which I ought to have somewhere), drop me a hint.

Cheers,

	Michael
