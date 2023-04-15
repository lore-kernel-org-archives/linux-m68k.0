Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E22AEC77B70
	for <linux-m68k@archiver.kernel.org>; Sat, 15 Apr 2023 21:57:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbjDOV5B (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 15 Apr 2023 17:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjDOV5A (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 15 Apr 2023 17:57:00 -0400
Received: from cynthia.allandria.com (cynthia.allandria.com [50.242.82.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 293963AA1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 15 Apr 2023 14:56:59 -0700 (PDT)
Received: from flar by cynthia.allandria.com with local (Exim 4.84_2)
        (envelope-from <flar@allandria.com>)
        id 1pnnt5-0006gE-CH; Sat, 15 Apr 2023 14:56:51 -0700
Date:   Sat, 15 Apr 2023 14:56:51 -0700
From:   Brad Boyer <flar@allandria.com>
To:     Eero Tamminen <oak@helsinkinet.fi>
Cc:     debian-68k@lists.debian.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: instrumentation, was Re: core dump analysis
Message-ID: <20230415215651.GA24321@allandria.com>
References: <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
 <8ff53c49-331e-1388-31c5-79cf21a2c201@gmail.com>
 <CAMuHMdVPayRjadOYxxZb-J7q-YtgZDwtCs93+Rz_ReSk+NHCwg@mail.gmail.com>
 <79ad6f51-5d02-0104-3b63-024e54a25e3c@gmail.com>
 <7106e764-4def-c03a-30d5-e4f810bd85cc@linux-m68k.org>
 <912d690c-c43c-8a72-ec8e-14cfb26785f1@gmail.com>
 <CAMuHMdXEKvKDPZWdzrEs0z=qS=hiK8AEwkSMgwoQcfjc_a4wEA@mail.gmail.com>
 <13a69c91-ca2b-42d8-dbd5-0b81e76044c6@gmail.com>
 <304e5c81-4e51-6c16-28d0-be48bf86a564@helsinkinet.fi>
 <eb1e55b6-7633-6100-667d-88029433e4c6@helsinkinet.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb1e55b6-7633-6100-667d-88029433e4c6@helsinkinet.fi>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, Apr 15, 2023 at 06:50:08PM +0300, Eero Tamminen wrote:
> I'm a bit surprised how many functions (symbol addresses) start with link.w
> instruction, instead of e.g. move* instruction.

That seems pretty normal to me. The LINK instruction sets up a stack
frame for a function. It takes an address register and size (the .w
suffix indicates a 16-bit size, while .l would indicate a 32-bit value
of size). The old value of the register is pushed to the stack, the
current stack pointer is saved into the given register, then the stack
is increased by the given size. There is a corresponding UNLK
instruction to tear down the stack frame which will frequently be the
last instruction before returning to the caller. The compiler will use
these in the function prologue and epilogue in all but the most
trivial functions.

	Brad Boyer
	flar@allandria.com

