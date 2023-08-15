Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA899C0015E
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Aug 2023 22:11:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239556AbjHOWLJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Aug 2023 18:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239393AbjHOWKq (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 15 Aug 2023 18:10:46 -0400
Received: from mail.sowerbutts.com (mail.sowerbutts.com [IPv6:2001:8b0:3b1:dead::100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F9D1FEC
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Aug 2023 15:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sowerbutts.com; s=igor; h=In-Reply-To:Content-Type:MIME-Version:References:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=sKdFVtD7grgEuwizycqWVEDwV161nZ3gwvZ38SzfAao=; b=eF3YxY0oOir7nPFE66CxdBPn2u
        xage2mc4BM3rVvmRpDhsWZBqP86JlbIDsxSNmpiTL95xdqTtx7bpSdRXewP45QbT9o9oC79FNiaYk
        kR0SiU+NC5Y14ycTw0MQdXZXRDIsI8N85ben5uxzQ35XeVFxtP5o398KFw9Pxhq6t3zGUj26l941K
        Y5UfTvdq/WTAsZ3hGiKuODWhFAdgJChLdjwYVaUV1YU78YXV+XcK4Bf+8sc8p13Nse8K3xhOk+WVS
        HhKkHhQhQz2XrcURzu5uOsLbxE27fw6qZBdF10Pt0Xnjx5qInSnqbURq0LJJ3LO45XN39RUANgceY
        2UCbqzkQ==;
Received: from [2001:8b0:3b1:cafe:2292:e7dd:dea3:4ff6] (helo=sowerbutts.com)
        by mail.sowerbutts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <will@sowerbutts.com>)
        id 1qW2FL-000Sh6-10;
        Tue, 15 Aug 2023 23:10:39 +0100
Date:   Tue, 15 Aug 2023 23:10:38 +0100
From:   William R Sowerbutts <will@sowerbutts.com>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Richard Z <rz@linux-m68k.org>, Finn Thain <fthain@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
Message-ID: <ZNv33s6jP6BEJf34@sowerbutts.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18f82a4d-5bd2-5b7a-53a2-8c61215267af@gmail.com>
X-URL:  http://sowerbutts.com/
X-Hatstand: Voltron
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

>As Geert explained, it was agreed by the IDE maintainers that any data byte
>order fixup needed would be handled in the block layer, and existing byte
>swapping options were removed as a result (as far as I recall, that was only
>ever necessary for Falcon and Q40).

Sensible

>> I'm not clear if pata_falcon on Atari records data on disk in normal or
>> swapped byte order.  Can I take a drive from my Atari Falcon Linux machine
>> and connect it to a PC without needing to byte swap it?
>No, such a disk can only be read on a PC when running ARAnyM (where the m68k
>Linux kernel then handles the necessary fixup). Data are in the wrong byte
>order when hooking up a Falcon IDE disk to a PC.

Interesting -- thank you

>'compatible byte order' would have to be the byte order used by the native 
>OS here. Meaning we pretty much do nothing, just use my latest RFC patch.

I agree

Will

_________________________________________________________________________
William R Sowerbutts                                  will@sowerbutts.com
"Carpe post meridiem"                               http://sowerbutts.com
         main(){char*s=">#=0> ^#X@#@^7=",c=0,m;for(;c<15;c++)for
         (m=-1;m<7;putchar(m++/6&c%3/2?10:s[c]-31&1<<m?42:32));}  

