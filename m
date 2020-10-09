Return-Path: <SRS0=PEg3=DQ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D1FC433DF
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Oct 2020 21:59:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDE9C22258
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Oct 2020 21:59:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387765AbgJIV7O (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Oct 2020 17:59:14 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:38686 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733059AbgJIV7O (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Oct 2020 17:59:14 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id 07AFB29EB2;
        Fri,  9 Oct 2020 17:59:10 -0400 (EDT)
Date:   Sat, 10 Oct 2020 08:59:03 +1100 (AEDT)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Laurent Vivier <laurent@vivier.eu>
cc:     linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Roman Zippel <zippel@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, Philip Blundell <philb@gnu.org>,
        Joshua Thompson <funaho@jurai.org>,
        Sam Creasey <sammy@sammy.net>
Subject: Re: [PATCH] m68k: remove unused mach_max_dma_address
In-Reply-To: <20201009095621.833192-1-laurent@vivier.eu>
Message-ID: <alpine.LNX.2.23.453.2010100857270.12@nippy.intranet>
References: <20201009095621.833192-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, 9 Oct 2020, Laurent Vivier wrote:

> This information is unused since the discontinuous memory support
> has been introduced in 2007.
> 
> Fixes: 12d810c1b8c2 ("m68k: discontinuous memory support")

Does this qualify as a bug fix?
