Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60AC3C6FD1C
	for <linux-m68k@archiver.kernel.org>; Tue, 14 Mar 2023 06:26:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjCNG0d (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 14 Mar 2023 02:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjCNG0c (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 14 Mar 2023 02:26:32 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BD5C8B337
        for <linux-m68k@lists.linux-m68k.org>; Mon, 13 Mar 2023 23:26:30 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 1983B5C021E;
        Tue, 14 Mar 2023 02:26:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 14 Mar 2023 02:26:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-id:content-type
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1678775188; x=
        1678861588; bh=GGSBxs6d4mquidYFVYDG3R5IJzV7p6KANTA+usMQfi0=; b=t
        g7td34+w45ujjBl/1j5AfZSEocw5XWIPEDr400fDlA6guAmtCP4Cc0VgnHej/xwZ
        4RNNIJ8yVSMoH3bWtEOJEMkuiuhqpYiSI1VLpoRZu9QvYFgttCqgp9MLD2nof6aE
        NbdtW2Kb08e4Bi2zQNgedBr850R5MtCx6p2IYTVYPFrnqKnskdBQeRMkC+LVwWxc
        tFepEjF+NqirhbCwNVvkGUg5rwn64gzI5H4OjFH1kQh8G2Qj2P6uuqgjKC1mXKUS
        TkKSXS0ZK2RazLSUyrZSs7sBRw9JByEjPeMqd12642SdiSGVeNPviIFRFY/XjK2n
        n1nFI3PEkpohB2TWls8Mw==
X-ME-Sender: <xms:kxMQZLg_xQIL_r2xJ86C5NM1Ke5ZmeAabbEwQLsh-occ51cgsFy7fw>
    <xme:kxMQZICN0fo4eXMZKWECP7WXdcTI8XqH-MkY9cTqAvrBKxR_fSsvHKq_wPBH4ptTL
    1hqO3oPcaTTkS4yGRc>
X-ME-Received: <xmr:kxMQZLGXunkg6VMaIG6g6nCcPscYsGWVn-IwDutKosZdyqYSif7MA7I0EFn8ynG4xcis1EtCYl8WFBFbBTGSx2NoQtTr56nKZ08>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvhedgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehmtderredttdejnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelfeeklefggfetkedukeevfffgvdeuheetffekledtfeejteelieejteeh
    geelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:kxMQZIQIyxLt_cdRPdz3lgYPUaETG2lhEyQ-39ET01ZImCsZVoAySg>
    <xmx:kxMQZIz8DPiaXZW0RFCQeKdjsk02yJAHg4zZSgnkY09mjsa5DVVGyg>
    <xmx:kxMQZO7rYwLLMPsAv4ckJd74yLckq0L3baze7UKfvqfPUVfMSnT_Bw>
    <xmx:lBMQZFog4djPhbiBniuqo9mnL7vJS7N4NzAQAQKmrD39t_0t_Z5H0Q>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Mar 2023 02:26:25 -0400 (EDT)
Date:   Tue, 14 Mar 2023 17:29:07 +1100 (AEDT)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
cc:     =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-m68k@lists.linux-m68k.org, kernel@pengutronix.de
Subject: Re: [PATCH] nubus: Drop noop match function
In-Reply-To: <20230313180848.2770504-1-u.kleine-koenig@pengutronix.de>
Message-ID: <5b61f399-7263-a93b-f6e6-626443d28bbf@linux-m68k.org>
References: <20230313180848.2770504-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="-1463811774-318504869-1678766142=:11989"
Content-ID: <429580db-98f1-ac87-8049-6aba15da75f5@nippy.intranet>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-318504869-1678766142=:11989
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <37989153-233b-2acf-e0f2-84f01d13f55f@nippy.intranet>

On Mon, 13 Mar 2023, Uwe Kleine-K=C3=B6nig wrote:

> nubus_bus_match() returned 1 unconditionally. This is equivalent to
> no match function at all. (See driver_match_device() which does:
>=20
> =09return drv->bus->match ? drv->bus->match(dev, drv) : 1;
>=20
> .)
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Finn Thain <fthain@linux-m68k.org>

Geert, would you please queue up this patch for the m68k tree?

> ---
>  drivers/nubus/bus.c | 6 ------
>  1 file changed, 6 deletions(-)
>=20
> diff --git a/drivers/nubus/bus.c b/drivers/nubus/bus.c
> index 17fad660032c..72921e4f35f6 100644
> --- a/drivers/nubus/bus.c
> +++ b/drivers/nubus/bus.c
> @@ -14,11 +14,6 @@
>  #define to_nubus_board(d)       container_of(d, struct nubus_board, dev)
>  #define to_nubus_driver(d)      container_of(d, struct nubus_driver, dri=
ver)
> =20
> -static int nubus_bus_match(struct device *dev, struct device_driver *dri=
ver)
> -{
> -=09return 1;
> -}
> -
>  static int nubus_device_probe(struct device *dev)
>  {
>  =09struct nubus_driver *ndrv =3D to_nubus_driver(dev->driver);
> @@ -39,7 +34,6 @@ static void nubus_device_remove(struct device *dev)
> =20
>  struct bus_type nubus_bus_type =3D {
>  =09.name=09=09=3D "nubus",
> -=09.match=09=09=3D nubus_bus_match,
>  =09.probe=09=09=3D nubus_device_probe,
>  =09.remove=09=09=3D nubus_device_remove,
>  };
>=20
---1463811774-318504869-1678766142=:11989--
