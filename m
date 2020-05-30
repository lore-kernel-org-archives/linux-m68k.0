Return-Path: <SRS0=U4C4=7M=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61652C433E0
	for <linux-m68k@archiver.kernel.org>; Sat, 30 May 2020 22:45:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A98B2076B
	for <linux-m68k@archiver.kernel.org>; Sat, 30 May 2020 22:45:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pY30yCP8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729517AbgE3Wp7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 30 May 2020 18:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729183AbgE3Wp6 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 30 May 2020 18:45:58 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9510CC03E969
        for <linux-m68k@lists.linux-m68k.org>; Sat, 30 May 2020 15:45:58 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id y18so1673346pfl.9
        for <linux-m68k@lists.linux-m68k.org>; Sat, 30 May 2020 15:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=KmFVp7JW0P1iv1Ad8Gzl6mJxySJt60NqKvtIl0fbQ9o=;
        b=pY30yCP8X1HpfEgEa2j6rf9UNm/R0Ryw6wGPXCn8VolHPGJbSfBfwkJrFCTHvNj30u
         V5qdEqveyGdIrdCSvMayzt3eFLRn32SxoAc5W9WfxL5wkI3EOwS4faDz1hazT8VxIbX4
         UBUlBXZhpJM7emJibY6iuOuil5tr4hvgJBmtv/2w3rGFuruje8CtYNtUO3+3bLvKd+6n
         4CA2BnNEh57cYxq3NXGU6E/kk2jUmXY5eRnOi22mHg/dS70r+FDhQk0JlgPQfuej6wVf
         iyXLK9gOQTtJAkh3Q//hySciIjbBtauehBxDOUOd2TRS35ZnF0fdPA37nuwqy5I3fu8Y
         xOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=KmFVp7JW0P1iv1Ad8Gzl6mJxySJt60NqKvtIl0fbQ9o=;
        b=gPNQ687zl2c2Y+w/9vigfPLyeciK5m5hUCw1uh3Ipwzk19CtmWoyckOOJiA+jruVRU
         /gYHJtwSAYWBUajqm+V7T2q6AM4TqB7CmGuJujcsfedX6IZyR0dIedenhQrQRRpSpXMQ
         3p84VgUJICtkY7wi76jT2QH8shJfRNWfIXCHEf2xx5KlhUto8R4AduN4f/sja3cAwjrm
         NHHHV00bfH7mU055yaLrh11/2N84LfdC/3LFBghBzD7cgbSdNOv4u6ZJrKRY99bLkOaf
         m5G8FjWsLIbFzKb87NFKrQhA1vHmFtVA76xheZ5GXGPZ6s22VhAoeJ7xw4f7P6Wo/Rc3
         nxGA==
X-Gm-Message-State: AOAM532dq3gdaqrOivOvwmvvO1MrBA4rdrNpqV1fFK09ISiVM/Xomdlc
        5tqYv+K+6xJV2cinLGAE5Zo=
X-Google-Smtp-Source: ABdhPJyo1Jt1ObabCxloG9GSaDTmn0an5FnDXM6ad0GoaI2NM/1DLz4Gfi4AHmlNIO71CxKMF/hCWQ==
X-Received: by 2002:a63:715a:: with SMTP id b26mr13670070pgn.433.1590878758044;
        Sat, 30 May 2020 15:45:58 -0700 (PDT)
Received: from [192.168.1.101] (122-58-178-240-adsl.sparkbb.co.nz. [122.58.178.240])
        by smtp.gmail.com with ESMTPSA id c14sm10378365pfp.122.2020.05.30.15.45.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 30 May 2020 15:45:57 -0700 (PDT)
Subject: Re: [m68k:m68k-queue 8/13] drivers/usb/host/isp116x.h:370:87: note:
 in expansion of macro 'isa_rom_writew_raw'
To:     Finn Thain <fthain@telegraphics.com.au>
References: <202005300247.nivoTcuo%lkp@intel.com>
 <18b6b8b1-d91e-56c9-2eef-6d79fc0ad3e9@gmail.com>
 <alpine.LNX.2.22.394.2005300930210.8@nippy.intranet>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Michael Schmitz <schmitz@debian.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <b69901cc-3ebe-125b-d1af-dee3230a16b6@gmail.com>
Date:   Sun, 31 May 2020 10:45:52 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.LNX.2.22.394.2005300930210.8@nippy.intranet>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 30.05.2020 um 11:32 schrieb Finn Thain:
> On Sat, 30 May 2020, Michael Schmitz wrote:
>
>> Hi Geert,
>>
>> the __w is used as a dummy read variable to execute a read cycle where
>> the address encodes the value to be written to the peripheral on the ROM
>> port. The value of this dummy variable is of no consequence (and may
>> very well be undefined).
>>
>> How do I annotate this so the compiler will shut up about it?
>>
>
> I think you want 'u16 __maybe_unused __w'.

Spot on, thanks.

Cheers,

	Michael


