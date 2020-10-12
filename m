Return-Path: <SRS0=v436=DT=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB211C433DF
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 13:57:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D28F2074F
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 13:57:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390323AbgJLN5N (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Oct 2020 09:57:13 -0400
Received: from smtp2.macqel.be ([109.135.2.61]:24495 "EHLO smtp2.macqel.be"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389345AbgJLNnk (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 12 Oct 2020 09:43:40 -0400
X-Greylist: delayed 570 seconds by postgrey-1.27 at vger.kernel.org; Mon, 12 Oct 2020 09:43:39 EDT
Received: from localhost (localhost [127.0.0.1])
        by smtp2.macqel.be (Postfix) with ESMTP id B7862150A81;
        Mon, 12 Oct 2020 15:34:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at macqel.be
Received: from smtp2.macqel.be ([127.0.0.1])
        by localhost (mail.macqel.be [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Amd8a68KNR-v; Mon, 12 Oct 2020 15:34:05 +0200 (CEST)
Received: from frolo.macqel.be (frolo.macqel [10.1.40.73])
        by smtp2.macqel.be (Postfix) with ESMTP id BEE9C13098A;
        Mon, 12 Oct 2020 15:34:05 +0200 (CEST)
Received: by frolo.macqel.be (Postfix, from userid 1000)
        id A44E7DF00A1; Mon, 12 Oct 2020 15:34:05 +0200 (CEST)
Date:   Mon, 12 Oct 2020 15:34:05 +0200
From:   Philippe De Muyter <phdm@macq.eu>
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     linux-m68k@vger.kernel.org
Subject: Re: [PATCH] m68knommu: align BSS section to 4-byte boundaries
Message-ID: <20201012133405.GA24704@frolo.macqel>
References: <20201012043432.787588-1-gerg@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201012043432.787588-1-gerg@linux-m68k.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Oct 12, 2020 at 02:34:32PM +1000, Greg Ungerer wrote:
> The kernel start up code for all of the nommu m68k types expects the
> BSS section to be on a 4-byte boundary, and to be a whole number of 32bit
> words. The BSS initialization loop sets 32bit sized quantities and has
> no provision for odd or unaligned accesses.
> 
> Although this has always been the case, in practice the BSS was typically
> aligned and sized this way. The problem was first observed after commit

not aligned and sized ... ?

Best regards

Philippe

-- 
Philippe De Muyter +32 2 6101532 Macq SA rue de l'Aeronef 2 B-1140 Bruxelles
