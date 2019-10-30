Return-Path: <SRS0=Ls/8=YX=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0601CA9EC5
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Oct 2019 19:17:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7DB17204FD
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Oct 2019 19:17:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbfJ3TRT (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 30 Oct 2019 15:17:19 -0400
Received: from cynthia.allandria.com ([50.242.82.17]:47451 "EHLO
        cynthia.allandria.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbfJ3TRT (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Oct 2019 15:17:19 -0400
X-Greylist: delayed 1474 seconds by postgrey-1.27 at vger.kernel.org; Wed, 30 Oct 2019 15:17:18 EDT
Received: from flar by cynthia.allandria.com with local (Exim 4.84_2)
        (envelope-from <flar@allandria.com>)
        id 1iPt5D-000098-IB; Wed, 30 Oct 2019 11:52:39 -0700
Date:   Wed, 30 Oct 2019 11:52:39 -0700
From:   Brad Boyer <brad@allandria.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Kars de Jong <jongk@linux-m68k.org>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Finn Thain <fthain@telegraphics.com.au>,
        Linux/m68k <linux-m68k@vger.kernel.org>
Subject: Re: [PATCH] esp_scsi: Add support for FSC chip
Message-ID: <20191030185239.GA32426@allandria.com>
References: <CACz-3rh9ZCyU1825yU8xxty5BGrwFhpbjKNoWnn0mGiv_h2Kag@mail.gmail.com>
 <20191029220503.7553-1-jongk@linux-m68k.org>
 <alpine.LNX.2.21.1910301109060.8@nippy.intranet>
 <28fd507e-580d-97c3-1cb3-2124940f2cae@gmail.com>
 <CACz-3rjP9ozpqb9ypGjJTr=c=ka252KF2xALWr8KHLCvGc1z-Q@mail.gmail.com>
 <CAMuHMdWMzvrVbfYDOZQcUK14h2Nzd7EqUJkwe3C+N3YUHYvyrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWMzvrVbfYDOZQcUK14h2Nzd7EqUJkwe3C+N3YUHYvyrQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Oct 30, 2019 at 09:45:05AM +0100, Geert Uytterhoeven wrote:
> Initially I wondere how the Apple MESH SCSI (also 53cf94 based) on
> my CHRP Longtrail used to work with this, until I realized my Longtrail
> died a few years before the new ESP SCSI driver was written ;-)

I was under the impression that MESH was not ESP based. It always had
(and still has) a completely separate driver. At least on my PowerMac
7600, there were two separate SCSI controllers for internal and
external devices. The external was run by mac53c94 (which still exists
in the source and doesn't use the shared ESP code) while the internal was
run by the mesh driver.

	Brad Boyer
	brad@allandria.com

