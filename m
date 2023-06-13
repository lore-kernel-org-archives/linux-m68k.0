Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBD3C7EE29
	for <linux-m68k@archiver.kernel.org>; Tue, 13 Jun 2023 06:47:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238780AbjFMGrZ convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 13 Jun 2023 02:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239148AbjFMGrX (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 13 Jun 2023 02:47:23 -0400
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02D0C172B
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jun 2023 23:47:13 -0700 (PDT)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1q8xo8-002PEE-Fm; Tue, 13 Jun 2023 08:47:12 +0200
Received: from p57bd9486.dip0.t-ipconnect.de ([87.189.148.134] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1q8xo8-003FFL-8b; Tue, 13 Jun 2023 08:47:12 +0200
Message-ID: <baa520109ab3a13d1ac8aca1c9b8eaeee070c241.camel@physik.fu-berlin.de>
Subject: Status of affs support in the kernel and affstools
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     debian-68k <debian-68k@lists.debian.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Artem Bityutskiy <dedekind1@gmail.com>
Date:   Tue, 13 Jun 2023 08:47:11 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.3 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.148.134
X-ZEDAT-Hint: PO
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hello!

I was wondering what the current status of the affs driver in the kernel is,
did it receive the fixes that Michael(?) was working on? I vaguely remember
there were some issues with larger filesystems or so and that someone was
working on fixing these issues.

Also, I noticed that Roman Zippel actually created an affstools package [1]
back in the day and I wonder whether anyone has any experience with it. In
particular, I'm wondering what »different mkfs.affs« Artem Bityutskiy is
talking about here [2]. Is there an alternative tool for creating and checking
affs filesystems?

If we package it for Debian, it would be possible to create affs partitions
from debian-installer which would be useful for anyone wanting to install
Debian on an Amiga without a Workbench installation on the harddisk.

Thanks,
Adrian

> [1] https://www.xs4all.nl/~zippel/affstools-0.1a.tar.gz
> [2] https://marc.info/?l=linux-m68k&m=133888043312812&w=2

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
