Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D363C433EF
	for <linux-m68k@archiver.kernel.org>; Wed,  3 Nov 2021 08:02:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 795C561175
	for <linux-m68k@archiver.kernel.org>; Wed,  3 Nov 2021 08:02:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhKCIF2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 3 Nov 2021 04:05:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:35878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230293AbhKCIF2 (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 3 Nov 2021 04:05:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36B6660F5A;
        Wed,  3 Nov 2021 08:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635926572;
        bh=ogFe37+pI8KQ1jbXB6QbzFezO6+ffCfRqWTo5P/1huM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fOSf92zaIIljZN8QxyH9pdNaBWYcn1EIQ9FNF1Vr4ix0VWQFIXirlWp1/i0QKs3DR
         BrA/7x7u6AokoFGE5CemAbteO9w66+A3Ajj9M/+2xs2e9m4XmGHq1Ev1zUYzgv3hD9
         ZsJtBnePPla4PgRmz5jMUG8p4BoFMEPQaFDKmnG3bq7NwWwBsGyjTTrGswwK5rPWI1
         yNc2jJcuCz6mLMjMBOMqboyI63+iN1Oxh/ZxK6hGaLXIrvJxxmoATFkLmlFGvnIBlQ
         d+kPhf2SCTZbYOLzU29jXCGSeThdYyJCr2OknuBtOWgehxSvOXf07MVz+WCYacIpzH
         MBzLzMtOWUTFw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1miBES-0003HW-SU; Wed, 03 Nov 2021 09:02:52 +0100
Date:   Wed, 3 Nov 2021 09:02:52 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Jingjing Liu <liujingjing@cdjrlc.com>
Cc:     gerg@linux-m68k.org, geert@linux-m68k.org,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m68k: coldfire: Prefer unsigned int to bare use of
 unsigned
Message-ID: <YYJCLKm1xVppeUV/@hovoldconsulting.com>
References: <20211103072252.24556-1-liujingjing@cdjrlc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211103072252.24556-1-liujingjing@cdjrlc.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Nov 03, 2021 at 03:22:52PM +0800, Jingjing Liu wrote:
> Fix checkpatch warnings:
> 	WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
> 
> Signed-off-by: Jingjing Liu <liujingjing@cdjrlc.com>

As I just wrote elsewhere:

Please don't run checkpatch.pl on code that's already in the kernel. Use
it to check your own patches before submitting them.

If you want to practise the patch submission process you can do so in
drivers/staging/ where "clean ups" such as this one are currently
accepted.

Johan
