Return-Path: <SRS0=881o=3C=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17037C33CA9
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Jan 2020 00:29:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D5EC922314
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Jan 2020 00:29:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=wp.pl header.i=@wp.pl header.b="aKNgkq6Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387509AbgAMA3E (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 12 Jan 2020 19:29:04 -0500
Received: from mx4.wp.pl ([212.77.101.12]:26342 "EHLO mx4.wp.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387493AbgAMA3E (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Sun, 12 Jan 2020 19:29:04 -0500
X-Greylist: delayed 399 seconds by postgrey-1.27 at vger.kernel.org; Sun, 12 Jan 2020 19:29:03 EST
Received: (wp-smtpd smtp.wp.pl 1600 invoked from network); 13 Jan 2020 01:22:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1578874942; bh=4VHhIw71LLQejAA8LkQP6zKGsiJBEin8PQmovjuoGzo=;
          h=From:To:Cc:Subject;
          b=aKNgkq6QvVwd+OGy/hmdKnHXoYupcHDFgY3YFCAIdyS8tT7k8pEL2uVOisZkp/O01
           IeT66Soa+ljUPV5fv8V11c8mWT8F97Dcs/4uZ968Z7JZt1n1T7jUYaUxrFEpU1fgEe
           bgrQx/ixE99wppxrIFziHrTsOlXPomsYx4D+FAI0=
Received: from c-73-93-4-247.hsd1.ca.comcast.net (HELO cakuba) (kubakici@wp.pl@[73.93.4.247])
          (envelope-sender <kubakici@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <geert@linux-m68k.org>; 13 Jan 2020 01:22:21 +0100
Date:   Sun, 12 Jan 2020 16:22:14 -0800
From:   Jakub Kicinski <kubakici@wp.pl>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-m68k@vger.kernel.org
Subject: Re: [PATCH] net: amd: a2065: Kill Sun LANCE relics
Message-ID: <20200112162214.78fde1e3@cakuba>
In-Reply-To: <20200112163211.18295-1-geert@linux-m68k.org>
References: <20200112163211.18295-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-WP-MailID: d807f0bcaff9a6ad7facbabee08541ec
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [0UNE]                               
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, 12 Jan 2020 17:32:11 +0100, Geert Uytterhoeven wrote:
> Remove unused fields, copied from the Sun LANCE driver eons ago.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Applied to net-next, thank you!
