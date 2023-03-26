Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D98ADC6FD1C
	for <linux-m68k@archiver.kernel.org>; Sun, 26 Mar 2023 00:03:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjCZADW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 25 Mar 2023 20:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjCZADV (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 25 Mar 2023 20:03:21 -0400
Received: from cynthia.allandria.com (cynthia.allandria.com [50.242.82.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F2691702;
        Sat, 25 Mar 2023 17:03:20 -0700 (PDT)
Received: from flar by cynthia.allandria.com with local (Exim 4.84_2)
        (envelope-from <flar@allandria.com>)
        id 1pgDqw-0008Oh-Re; Sat, 25 Mar 2023 17:03:18 -0700
Date:   Sat, 25 Mar 2023 17:03:18 -0700
From:   Brad Boyer <flar@allandria.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Finn Thain <fthain@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] nubus: Don't list card resources by default
Message-ID: <20230326000318.GB31801@allandria.com>
References: <5b7c473247d66776343d82a55b9815195b1b11fb.1679551394.git.fthain@linux-m68k.org>
 <CAMuHMdUJ6kbpYGTjyY5dX+-YRv3pL0ydG3HQ-H1khyeqLOa05A@mail.gmail.com>
 <072fd894-ec50-ae5f-2be5-ebbeb0e7b39b@linux-m68k.org>
 <20230324085927.GA6354@allandria.com>
 <0cd7f288-ba43-7764-01a7-2e1e5c7a1640@linux-m68k.org>
 <CAMuHMdXi1mF=j_Qzzg971AqHF-JdgfaDd+v0HymXXusFt-WBUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXi1mF=j_Qzzg971AqHF-JdgfaDd+v0HymXXusFt-WBUQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, Mar 25, 2023 at 01:44:43PM +0100, Geert Uytterhoeven wrote:
> Perhaps it would be worthwhile to move the resources out of /proc,
> but into a separate virtual file system?
> That way people who need access to the additional info can load the
> separate virtual file system kernel module, and mount the file system?

I could be wrong, but I believe the more recent trend has been to
move things like this out of /proc anyway.

	Brad Boyer
	flar@allandria.com

