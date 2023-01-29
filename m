Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F656C61D97
	for <linux-m68k@archiver.kernel.org>; Sun, 29 Jan 2023 10:09:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjA2KI7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 29 Jan 2023 05:08:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjA2KI6 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 29 Jan 2023 05:08:58 -0500
X-Greylist: delayed 468 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 29 Jan 2023 02:08:56 PST
Received: from scenergy.dfmk.hu (scenergy.dfmk.hu [193.224.143.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C17E18B0C
        for <linux-m68k@lists.linux-m68k.org>; Sun, 29 Jan 2023 02:08:56 -0800 (PST)
Received: by scenergy.dfmk.hu (Postfix, from userid 1000)
        id 615B4800401; Sun, 29 Jan 2023 11:00:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by scenergy.dfmk.hu (Postfix) with ESMTP id 221828003F5;
        Sun, 29 Jan 2023 11:00:22 +0100 (CET)
Date:   Sun, 29 Jan 2023 11:00:21 +0100 (CET)
From:   Karoly Balogh <charlie@scenergy.dfmk.hu>
To:     Chris Hanson <cmhanson@eschatologist.net>
cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>, port-m68k@netbsd.org
Subject: Re: Work on adding TLS support to LLVM on m68k
In-Reply-To: <E11E3305-75B1-42FD-A839-46CF93DA5785@eschatologist.net>
Message-ID: <alpine.DEB.2.02.2301291018310.2793@scenergy.dfmk.hu>
References: <1dfde9d2-250f-dd1b-1775-76917f4b2166@physik.fu-berlin.de> <E11E3305-75B1-42FD-A839-46CF93DA5785@eschatologist.net>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1628901010-1674986422=:2793"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1628901010-1674986422=:2793
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: 8BIT

Hi,

On Sat, 28 Jan 2023, Chris Hanson wrote:

> That said, any compiler or linker for 68K needs to support multiple ABI
> standards since Mac OS, Atari, Amiga, and all the different UNIX and
> UNIX-like operating systems had their own ABI. Fortunately LLVM itself
> supports the concept of multiple ABIs…

Indeed, but the systems you mention A., use a mixure of ABIs, I mean one
system with many ABIs, even if there are some "basic assumptions" about
volatile/nonvolatile registers and so on, but otherwise "you're on your
own", and B., neither of these have "threads" as such, let alone anything
that resembles the concept of a Thread Local Storage in the modern sense.

Point is: it's safe to start on Linux/NetBSD, because there the OS at
least knows about these as a concept, so there's some framework for it to
follow as guard rails. Elsewhere - prepare for a lot of faking, and
hacking, and cheating. :)

(Ask me where I know... ;) )

Charlie
--8323329-1628901010-1674986422=:2793--
