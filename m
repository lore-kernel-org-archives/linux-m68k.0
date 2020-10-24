Return-Path: <SRS0=UdPK=D7=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F8AC2D0A3
	for <linux-m68k@archiver.kernel.org>; Sat, 24 Oct 2020 19:25:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A34C122269
	for <linux-m68k@archiver.kernel.org>; Sat, 24 Oct 2020 19:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603567554;
	bh=+Z2K9Qse3gsmfv6McV3d3YcqHsnE4d/GWo1YBfOGnFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=QZWWCjRImaP6OhNELZrAb5znZwpxYODIFMezANuoAwV2MOxp+yqQJ+XgEcxNAta9d
	 0Mz0qCYDPohkxvO9feI7c4K0i8bGPxsnKcmJLvcHC3EmY9adBif8qVNlZ/ZvjeVLyS
	 ti5IFbQ/H6IEvJZ9RwOnp7bkM89W9LQQB8Wh41y4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1764013AbgJXTZx (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 24 Oct 2020 15:25:53 -0400
Received: from mail-ej1-f54.google.com ([209.85.218.54]:44156 "EHLO
        mail-ej1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1762022AbgJXTZx (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 24 Oct 2020 15:25:53 -0400
Received: by mail-ej1-f54.google.com with SMTP id d6so2668344ejb.11
        for <linux-m68k@lists.linux-m68k.org>; Sat, 24 Oct 2020 12:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TLAjqKGwG9KBTJU+h2eNa+b2vfnfynxdcIStBSwg9s4=;
        b=DpL1zU8I5kBeC2eNdUvzKxWa/NIGqYEKIdF0W1qNs0Ps32+Im3gldb+Fjqb/9mXCNE
         2AZfrfJglIhteKKpas2eo2Brq5mF4hadlsymDE4VZd59r2RAvhOQ1mnvPNsiPHhDxNhh
         8p+fWdp7nPAwXa1B3z8I696PvSwW/U35UOTYi0b1sU+ZMJjXQqataOmxfI5a/ffG/o3L
         SW98r8zy8Q0ZKHo7Hv6nC6cm3PVkLoa6W2ZHlFSjVbhcW7FMkOqtyFKvWLJfqFnAUUbR
         BCb1HR2n9mqDwlfhnvaXcCNuC8NsVLDwGUuu04zb6/b9ZOgZIzay/Io2OjJjlIDrto5F
         3iqQ==
X-Gm-Message-State: AOAM5328DGrodlW0vyRolcSihgnpLGkYpE+QqiWwcWBI4eQtiq+muhPS
        GCH7REC+VjkCBYfBKpQEseQ=
X-Google-Smtp-Source: ABdhPJzcf8XrXm3mJJ7Wljc+hwwT4j290CugNtxIYbd12G5YdZmR/KiLSAgQHBZKsrjQLNwM7JqPEg==
X-Received: by 2002:a17:906:da03:: with SMTP id fi3mr6304618ejb.321.1603567551759;
        Sat, 24 Oct 2020 12:25:51 -0700 (PDT)
Received: from kozik-lap ([194.230.155.174])
        by smtp.googlemail.com with ESMTPSA id m1sm2844109ejj.117.2020.10.24.12.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2020 12:25:49 -0700 (PDT)
Date:   Sat, 24 Oct 2020 21:25:47 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Subject: Re: [PATCH 2/2] i2c: imx: remove id_table entry
Message-ID: <20201024192547.GA4638@kozik-lap>
References: <1603441103-17735-1-git-send-email-peng.fan@nxp.com>
 <1603441103-17735-2-git-send-email-peng.fan@nxp.com>
 <20201023152842.GA5227@kozik-lap>
 <DB6PR0402MB2760D2A54C69E7AAAB366C78881B0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DB6PR0402MB2760D2A54C69E7AAAB366C78881B0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, Oct 24, 2020 at 07:47:13AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH 2/2] i2c: imx: remove id_table entry
> > 
> > On Fri, Oct 23, 2020 at 04:18:23PM +0800, peng.fan@nxp.com wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > The legacy platform device code has been removed under
> > > arch/arm/mach-imx, so we no need id_table entry here.
> > 
> > Cc: Greg, Geert, Angelo,
> > 
> > Aren't you breaking Coldfire platforms?
> 
> Ok, I see coldfire still use use imx1-i2c. Could we remove imx21-i2c or still
> keep it?

Did you check if anything else uses it?

Best regards,
Krzysztof
