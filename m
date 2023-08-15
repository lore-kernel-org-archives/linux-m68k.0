Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F649C001B0
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Aug 2023 09:50:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233294AbjHOJty (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Aug 2023 05:49:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233944AbjHOJtV (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 15 Aug 2023 05:49:21 -0400
Received: from mail.sowerbutts.com (mail.sowerbutts.com [IPv6:2001:8b0:3b1:dead::100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B36A94
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Aug 2023 02:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sowerbutts.com; s=igor; h=In-Reply-To:Content-Type:MIME-Version:References:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=b2YfGbMiKbaY8yKe+Cb1YquBYLZFEUwtILKbnodNkPM=; b=lBEYm5uJsfXE78AqbSaPa1bXcH
        xc0leFa+XZdFeO34iHGg7+M3y6um/JWfXFcWv92J4JGl8sgNG3NFyPGMixbL5ZIMVh0YsOmhg8u30
        AhLAozC66wRbY8uznIwBSDPJHlULzL+tvJEileKtcRKno6n2l+ofMPp7OY3h6i6VtaRYmJOfnAIpS
        xc9EnAqdRXI+NBdIZENy2y5O2z7oOjAgizah61Abt+V2IwcqlGmwJ1gTYAz0KME9YjdsC6Ll5O2Rz
        bIsXEfH7L+hRMYuO7GglSKR4AbF6hgUIOCXB630gdBVS/ArvZoHMj9UGW68IIPn9F5Erh/DbjPMRM
        8gOWD+qQ==;
Received: from badhorse.sowerbutts.com ([2001:8b0:3b1:beef::bad] helo=sowerbutts.com)
        by mail.sowerbutts.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <will@sowerbutts.com>)
        id 1qVqfp-000P2B-2p;
        Tue, 15 Aug 2023 10:49:13 +0100
Date:   Tue, 15 Aug 2023 10:49:13 +0100
From:   William R Sowerbutts <will@sowerbutts.com>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Richard Z <rz@linux-m68k.org>, Finn Thain <fthain@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
Message-ID: <ZNtKGaIgs4Dy2/6b@sowerbutts.com>
References: <68187ca1-1d4f-92f9-f6c7-476caaa24df0@gmail.com>
 <275c3e98-a8e3-5d2a-13fa-db79ab9d6719@linux-m68k.org>
 <ZNlYFCVubNgzmUfc@sowerbutts.com>
 <c8fd631b-226c-4c60-884b-2ffa6437d03f@gmail.com>
 <ZNoNlC5fhztMFBAk@sowerbutts.com>
 <edd601bc-56c4-fa33-3a68-285eca768f13@gmail.com>
 <39D1BBAD-DCA8-4E0E-ACFD-529DECA233B8@linux-m68k.org>
 <e3964f47-c892-6453-f685-5a06e154f89a@linux-m68k.org>
 <AFCD9AA4-7A09-4AF5-B3BE-1C5554BFB8D2@linux-m68k.org>
 <e36baf9d-b027-380c-de91-c9ff52857168@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e36baf9d-b027-380c-de91-c9ff52857168@gmail.com>
X-URL:  http://sowerbutts.com/
X-Hatstand: Voltron
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

>We need to fix pata_falcon for Q40, and with data on William's disk in 
>little endian order, but data on other users' disks in big endian order, we 
>need to come up with a way to support both for now.

I don't mind if you break my disk -- I can always byte-swap it if required,
or patch my kernel to use my preferred byte ordering.

Valid points have been made about needing to keep existing disks working.  

For the kernel driver to switch byte order after some specific version seems
unexpected.

On the other hand, having disks compatible with other systems is important, 
and as a naive new user the byte-swapped disk format was quite unexpected to 
me.

It seems there are reasonable arguments for both sides.

I had a cursory look through other drivers and could not find any that make 
byte ordering a user-selectable option.  Is there any precedent for this?  It 
would be interesting to learn how they exposed the option to the user.

I'm not clear if pata_falcon on Atari records data on disk in normal or 
swapped byte order.  Can I take a drive from my Atari Falcon Linux machine 
and connect it to a PC without needing to byte swap it?

I want to float some potential solutions for discussion;

 * Add a kernel configuration option to choose between legacy and compatible 
   byte ordering on Q40 at compile time (affecting all disks)
 
 * Add a pata_falcon driver option to choose which of the connected disks 
   should use legacy or compatible byte ordering at run time

 * Extend pata_falcon to examine the connected disk's contents, looking for 
   some marker that reliably indicates a legacy byte order disk is connected.  
   Default to compatible byte ordering if this mark is not found.  Maybe it 
   would be cleaner for some optional module atop the driver to do this.

 * Assuming pata_legacy can be made to work well: Have pata_falcon retain 
   legacy byte ordering, while pata_legacy drives the same hardware in 
   compatible byte ordering mode.  User chooses the driver to choose byte 
   ordering.

 * Switch pata_falcon to compatible byte order, document for any legacy disk 
   users how they can either do a one-time migration of their data to 
   compatible format, or setup the block layer to do byte swapping 
   on-the-fly.

Thanks

Will

_________________________________________________________________________
William R Sowerbutts                                  will@sowerbutts.com
"Carpe post meridiem"                               http://sowerbutts.com
         main(){char*s=">#=0> ^#X@#@^7=",c=0,m;for(;c<15;c++)for
         (m=-1;m<7;putchar(m++/6&c%3/2?10:s[c]-31&1<<m?42:32));}  

