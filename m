Return-Path: <SRS0=cuPX=CA=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D915CC433E1
	for <linux-m68k@archiver.kernel.org>; Sat, 22 Aug 2020 19:16:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B28652072D
	for <linux-m68k@archiver.kernel.org>; Sat, 22 Aug 2020 19:16:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uPYVhcL7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728530AbgHVTQz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 22 Aug 2020 15:16:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728611AbgHVTQy (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 22 Aug 2020 15:16:54 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A58FC061574
        for <linux-m68k@lists.linux-m68k.org>; Sat, 22 Aug 2020 12:16:54 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 74so2722962pfx.13
        for <linux-m68k@lists.linux-m68k.org>; Sat, 22 Aug 2020 12:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=/3rrzjkBPMkRfxyZJsXUl9zBnz3ujjXiErFFJac+oQs=;
        b=uPYVhcL7xzbHKms1yzfKb1FkPE0HfJ0koKxam4qSH6MA+LJBkqKGTX/RxvSGsCA7N8
         piP0vlYEqrv7/HJFrPDHy923i8jHzRwIezo8JGbd8SyfvwafwQtKGcnrJY8JjJEU6z/A
         AJmbwgVe0YWl1MwMzHiPJQrMSSkwhXJ5mtbpOPJurJW6cDdXVCkpX5NwRCrca4SSTO3p
         u9icfUXAwAdUMKv/cdkJNGNorn1SN1TiFB2MRBclNV/u+kRwrJemLAQI+QaSQlJkm75U
         PNPz7jq7nR2WFQ0ZarppLmuiw+THFGCaFpwch8ZOMpgaXrCWqyhjGAr6DlnSyIV0vfve
         TLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=/3rrzjkBPMkRfxyZJsXUl9zBnz3ujjXiErFFJac+oQs=;
        b=Zd2YA37KTPWOjligmwUjDrJp/yPsx841+mWiD5ayKqoJq7g+XLcM9uYNn0rRMB97Y4
         PxVq1rpQPRQe1pt7Ie3JdBdiLECJNBig70bfSQ7XckLFf+NpTJ4P5mWv/npA5xn1foLu
         /Vxcs0I8Yy2bxT3XGwYcPGXwO3VDEujFvcjt/DRymZQrntxu879zvSBV3DC9Od9ISVC6
         AzDNXNdVvrDdTEueBhRqbqdmpaNNWvM5ZEjBzb/XSuuSNH8eSrVleF7kB5swG8aqvR3i
         OQa55Sq6RC+92SpPMmhVcXhmUfV76MNSc0eOzbtimzqKZdGB5TFyj4qkjV6Gypu30RaB
         Wwpw==
X-Gm-Message-State: AOAM532DfTIXqVnZjzzvoaKsnRl53NaDlgQ84fGRjHGQ4pBVP0EFa1t5
        +h97EXfSzhqEs6o0DgOVtFA=
X-Google-Smtp-Source: ABdhPJwflP0i3oxaracTNdz2FJ1/Br6Tni5ECBGUfkemILMhTf5+cCkbHAQNs/sOXYjxE0gHpi/4Yw==
X-Received: by 2002:a63:cb0e:: with SMTP id p14mr5987913pgg.351.1598123811710;
        Sat, 22 Aug 2020 12:16:51 -0700 (PDT)
Received: from [192.168.1.101] (122-58-181-132-adsl.sparkbb.co.nz. [122.58.181.132])
        by smtp.gmail.com with ESMTPSA id z17sm6592553pfq.38.2020.08.22.12.16.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Aug 2020 12:16:51 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] m68k/mm: switch from DISCONTIGMEM to SPARSEMEM
To:     Mike Rapoport <rppt@kernel.org>
References: <20200718162651.26538-1-rppt@kernel.org>
 <20200820160334.GA752365@kernel.org>
 <5d16d058-a544-5f69-07e9-59da5ffafaf2@gmail.com>
 <20200821075636.GF752365@kernel.org>
 <9ea389e1-bd86-953b-8ae2-40278506e30a@gmail.com>
 <20200822095131.GG752365@kernel.org>
Cc:     linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Finn Thain <fthain@telegraphics.com.au>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Mike Rapoport <rppt@linux.ibm.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <28567532-3406-5086-0f77-568af4bbabcf@gmail.com>
Date:   Sun, 23 Aug 2020 07:16:45 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200822095131.GG752365@kernel.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Mike,

Am 22.08.2020 um 21:51 schrieb Mike Rapoport:
> Hi Michael,
>
> On Sat, Aug 22, 2020 at 11:27:18AM +1200, Michael Schmitz wrote:
>> Hi Mike,
>>
>> only tested on ARAnyM, but appears to work (after adding sparsemem.h and
>> changing memblocks_present() to non-static).
>
> Cool, thanks!
> memblocks_present() is now called from sparse_init() and can be simply
> dropped.

Right you are - I missed that in the hurry.

>
>> 20 kB more total memory with sparsemem. Less memory used when booting
>> to FastRAM, more used when booting to ST-RAM (checked right after boot
>> on an idle system). The latter probably isn't significant.
>
> When booting to FastRAM we still discard ST-RAM and only use it as
> device memory for the framebuffer. So the total memory map size will be
> smaller.

Makes sense, but I was still surprised that replacing discontigmem by 
sparsemem saves 20 kB regardless of whether or not ST-RAM is used.

> How many FastRAM do you have in your configuration?

Only 256 MB. Can't use much more on my old Powerbook.

Cheers,

	Michael

