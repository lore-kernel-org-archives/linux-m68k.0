Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F34C001DF
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Aug 2023 22:39:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232422AbjHOWi4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Aug 2023 18:38:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236609AbjHOWiq (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 15 Aug 2023 18:38:46 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 611D61BCC
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Aug 2023 15:38:44 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6bb07d274feso5132779a34.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Aug 2023 15:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692139123; x=1692743923;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q4Hb2V0uwtRhQKHpsZzDZM4z06iCGcgnP/dOTZza2EI=;
        b=djWg/5gM39lVNrM8VBbzlaNkbWPl0P3JOZLOKpSe6fIL7Qy+i4mGcxsnu5ws03OGWN
         Yfex9Ovvgpt9xCW+oAjexrilM0nY/ZZzMXY9DBR92L5oEANlVcrqf9qb9v1smrpT3uPa
         19qRmmaFkis3ZIoFXbaE8oHG2ohn6Z6Nj6FGDKw5qqqKmIihaDcbdHqV1/8j8C6WWyDF
         p9qovnCrNROJGfGDIF2FRg/nKIfl26tsjgb2lpNIf87N/WFHWSQzztae9U+EOfRkfkKm
         ozOLqP6EZJScXyw0xxxm2HduQFqVQXTwgxmvLhWUKkYDFTfcaPI+AiLArdpJdbL53utt
         RV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692139123; x=1692743923;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4Hb2V0uwtRhQKHpsZzDZM4z06iCGcgnP/dOTZza2EI=;
        b=fATsraaP62ir2LDdxvhbcirmtxUSh3QidaomSXpKWYUOaWWB882KKfXj7sGT8MUYFF
         hs0ghAEBC+THs7zESpaQNpJj8/e+1puzErv/mqtmB9MGb5dXRYRW4oURXpSVpVB7m60S
         nTGkaTkrFRS2YVzG8+DNOCZNNcj1nEeqmzVcwuhSf+KrawPmN/a5NBwbzlwmpXVx1uya
         4zMncJIQg+ShpE1o3Oi33o6yi8eeMxRgZyvhtJ63zPEl7tmNZTdmvHbORoGXwqH7wmDe
         MaODbR0CnEz/bHNFUgBvBYE1BPBRsfHooSC616PZoi5xEkN84ZkFUWnhmihPnurRaoU0
         +gzA==
X-Gm-Message-State: AOJu0YySD1bLhaI6cD9xe4KieGakUOLITmTqA4IJcRmuKqDydoRpZeU7
        KIIL9rgfzL7i6ypyQiceSgY=
X-Google-Smtp-Source: AGHT+IF34Z78q8T2hWUDbwiAQAFMdD9oTz0+ah0+0S4VWh3HbRfVlk9+FEq/XHJrHso+w6O5y1UdgQ==
X-Received: by 2002:a05:6830:d0:b0:6bc:8594:b16c with SMTP id x16-20020a05683000d000b006bc8594b16cmr82639oto.10.1692139123506;
        Tue, 15 Aug 2023 15:38:43 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:4938:8f81:4e3b:b829? ([2001:df0:0:200c:4938:8f81:4e3b:b829])
        by smtp.gmail.com with ESMTPSA id j17-20020a62b611000000b00687f845f41fsm9717995pff.119.2023.08.15.15.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 15:38:43 -0700 (PDT)
Message-ID: <e7c2ab09-6fbe-b698-f016-b90029c9849a@gmail.com>
Date:   Wed, 16 Aug 2023 10:38:38 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
Content-Language: en-US
To:     William R Sowerbutts <will@sowerbutts.com>
Cc:     Richard Z <rz@linux-m68k.org>, Finn Thain <fthain@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <ZNlYFCVubNgzmUfc@sowerbutts.com>
 <c8fd631b-226c-4c60-884b-2ffa6437d03f@gmail.com>
 <ZNoNlC5fhztMFBAk@sowerbutts.com>
 <edd601bc-56c4-fa33-3a68-285eca768f13@gmail.com>
 <39D1BBAD-DCA8-4E0E-ACFD-529DECA233B8@linux-m68k.org>
 <e3964f47-c892-6453-f685-5a06e154f89a@linux-m68k.org>
 <AFCD9AA4-7A09-4AF5-B3BE-1C5554BFB8D2@linux-m68k.org>
 <e36baf9d-b027-380c-de91-c9ff52857168@gmail.com>
 <ZNtKGaIgs4Dy2/6b@sowerbutts.com>
 <18f82a4d-5bd2-5b7a-53a2-8c61215267af@gmail.com>
 <ZNv33s6jP6BEJf34@sowerbutts.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <ZNv33s6jP6BEJf34@sowerbutts.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Will,

On 16/08/23 10:10, William R Sowerbutts wrote:
>> As Geert explained, it was agreed by the IDE maintainers that any data byte
>> order fixup needed would be handled in the block layer, and existing byte
>> swapping options were removed as a result (as far as I recall, that was only
>> ever necessary for Falcon and Q40).
> Sensible
>
>>> I'm not clear if pata_falcon on Atari records data on disk in normal or
>>> swapped byte order.  Can I take a drive from my Atari Falcon Linux machine
>>> and connect it to a PC without needing to byte swap it?
>> No, such a disk can only be read on a PC when running ARAnyM (where the m68k
>> Linux kernel then handles the necessary fixup). Data are in the wrong byte
>> order when hooking up a Falcon IDE disk to a PC.
> Interesting -- thank you
>
>> 'compatible byte order' would have to be the byte order used by the native
>> OS here. Meaning we pretty much do nothing, just use my latest RFC patch.

I've sent a v3 of my patch which adds a module option to select which 
drive will get extra byte swapping on data transfers. Please give that a 
try. So far tested on ARAnyM with one Atari and one Mac disk image (the 
latter of which would have needed byte swapping by ARAnyM before, and 
can now be read without that trick).

If that works, I'd send this patch to linux-ide for review (split in two 
parts, the first as the minimal bugfix to restore Q40 support, the 
second as optional data portability feature on top).

Cheers,

     Michael


> I agree
>
> Will
>
> _________________________________________________________________________
> William R Sowerbutts                                  will@sowerbutts.com
> "Carpe post meridiem"                               http://sowerbutts.com
>           main(){char*s=">#=0> ^#X@#@^7=",c=0,m;for(;c<15;c++)for
>           (m=-1;m<7;putchar(m++/6&c%3/2?10:s[c]-31&1<<m?42:32));}
>
