Return-Path: <SRS0=Ru6R=AA=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9ACFC433E0
	for <linux-m68k@archiver.kernel.org>; Fri, 19 Jun 2020 06:33:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A91982078D
	for <linux-m68k@archiver.kernel.org>; Fri, 19 Jun 2020 06:33:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbgFSGdZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 19 Jun 2020 02:33:25 -0400
Received: from cynthia.allandria.com ([50.242.82.17]:37422 "EHLO
        cynthia.allandria.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbgFSGdZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 19 Jun 2020 02:33:25 -0400
Received: from flar by cynthia.allandria.com with local (Exim 4.84_2)
        (envelope-from <flar@allandria.com>)
        id 1jmAaY-0004wW-KN; Thu, 18 Jun 2020 23:33:22 -0700
Date:   Thu, 18 Jun 2020 23:33:22 -0700
From:   Brad Boyer <flar@allandria.com>
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     Josh Juran <jjuran@gmail.com>, linux-m68k@lists.linux-m68k.org
Subject: Re: penguin (was Re: Linux-mac68k project account maintenance)
Message-ID: <20200619063322.GA18201@allandria.com>
References: <alpine.LNX.2.22.394.2006151113030.17@nippy.intranet>
 <0A4C54D6-956E-4E46-90DB-BA89B0ED66EB@gmail.com>
 <alpine.LNX.2.22.394.2006151336260.34@nippy.intranet>
 <7A36365D-870D-46A2-9091-051074465693@gmail.com>
 <alpine.LNX.2.22.394.2006190949530.11@nippy.intranet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.22.394.2006190949530.11@nippy.intranet>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jun 19, 2020 at 11:39:49AM +1000, Finn Thain wrote:
> MAME/MESS can boot MacOS. There is work under way to boot MacOS in 
> qemu-system-m68k.
> 
> But outside of A/UX, I don't know of any way to get hardware assisted 
> virtualization for 68k MacOS applications.

It didn't work on Linux last I checked, but Basilisk II has support for
running directly on the CPU in NetBSD while only emulating the
supervisor instructions (it used a signal handler to detect and handle
anything that would cause an exception). I looked at the code, and it
appeared to be possible to do the same on Linux with some tweaks to
the signal handler (Linux passes the extra context differently).

However, Basilisk II can only boot MacOS because it doesn't actually
emulate all the hardware. In a few cases, it emulates synthetic
devices and inserts its own drivers with fake expansion ROMs. This
means you can't run Linux, NetBSD, or A/UX.

	Brad Boyer
	flar@allandria.com

