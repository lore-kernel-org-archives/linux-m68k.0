Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311A8C43334
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Jul 2022 23:15:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbiGKXPe (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 11 Jul 2022 19:15:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbiGKXPd (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 11 Jul 2022 19:15:33 -0400
X-Greylist: delayed 2142 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 11 Jul 2022 16:15:33 PDT
Received: from cynthia.allandria.com (cynthia.allandria.com [50.242.82.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B0785D70
        for <linux-m68k@vger.kernel.org>; Mon, 11 Jul 2022 16:15:33 -0700 (PDT)
Received: from flar by cynthia.allandria.com with local (Exim 4.84_2)
        (envelope-from <flar@allandria.com>)
        id 1oB24B-0006MM-Ok; Mon, 11 Jul 2022 15:39:47 -0700
Date:   Mon, 11 Jul 2022 15:39:47 -0700
From:   Brad Boyer <flar@allandria.com>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Linux/m68k <linux-m68k@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1 1/4] m68k - add MVME147 SCSI base address to
 mvme147hw.h
Message-ID: <20220711223947.GA22820@allandria.com>
References: <20220709001019.11149-1-schmitzmic@gmail.com>
 <20220709001019.11149-2-schmitzmic@gmail.com>
 <CAK8P3a2kwg56-UTv275GJ1r_SDsfoX2fMcmXrvNURN+L3UHoSA@mail.gmail.com>
 <89f0efa9-9626-2380-49dc-432ac04fe6f2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89f0efa9-9626-2380-49dc-432ac04fe6f2@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jul 11, 2022 at 04:16:17PM +1200, Michael Schmitz wrote:
> Found no other wd33c93 drivers...

If it matters, I have a wd33c93 based NuBus card. I've just never
found the time to write a driver for it. To be honest, I haven't
even put it in a system to see if it works.

	Brad Boyer
	flar@allandria.com

