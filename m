Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D26DEB64DC
	for <linux-m68k@archiver.kernel.org>; Mon,  3 Jul 2023 05:34:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbjGCFen (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 3 Jul 2023 01:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbjGCFei (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 3 Jul 2023 01:34:38 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D09BD180
        for <linux-m68k@lists.linux-m68k.org>; Sun,  2 Jul 2023 22:34:37 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZP73BxXz4wxw;
        Mon,  3 Jul 2023 15:34:35 +1000 (AEST)
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
To:     linuxppc-dev@lists.ozlabs.org,
        Michael Ellerman <mpe@ellerman.id.au>
Cc:     geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20230531125023.1121060-1-mpe@ellerman.id.au>
References: <20230531125023.1121060-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] MAINTAINERS: Exclude m68k-only drivers from powerpc entry
Message-Id: <168836201881.50010.8898092741699010694.b4-ty@ellerman.id.au>
Date:   Mon, 03 Jul 2023 15:26:58 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, 31 May 2023 22:50:23 +1000, Michael Ellerman wrote:
> The powerpc section has a "F:" entry for drivers/macintosh, matching all
> files in or below drivers/macintosh. That is correct for the most part,
> but there are a couple of m68k-only drivers in the directory, so exclude
> those.
> 
> 

Applied to powerpc/next.

[1/1] MAINTAINERS: Exclude m68k-only drivers from powerpc entry
      https://git.kernel.org/powerpc/c/a43d52ab96f97967f4c5d28d1607fb1179057786

cheers
