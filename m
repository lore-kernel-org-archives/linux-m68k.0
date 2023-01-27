Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D788EC38142
	for <linux-m68k@archiver.kernel.org>; Fri, 27 Jan 2023 13:50:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233042AbjA0NuC (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 27 Jan 2023 08:50:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjA0NuB (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 27 Jan 2023 08:50:01 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E09F7EFEB
        for <linux-m68k@lists.linux-m68k.org>; Fri, 27 Jan 2023 05:50:00 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id e8so4002327qts.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 27 Jan 2023 05:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wgiPmC+FdFl/fTe/yX2Cl30R0fh7FEB3nAmm+nj/2MA=;
        b=jQ9SCPVDb2ZFXQ71Ba3zwY8OWJFm3ZH4knwv5Rl8oNCvBbxWWdtwOdCv2JqQKXhH30
         GyW+voPqcbiYbPDvM5mZd+59LbEQ7obzD/bnrGJLr+rbIGqJJu5KeFWr+0+W9GShGcBo
         u9XL/dSF9RtO1h9G+JGWC/8DhumlkQWVW6z6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wgiPmC+FdFl/fTe/yX2Cl30R0fh7FEB3nAmm+nj/2MA=;
        b=IQx2Zxr53EP27+4DEcpVnZFjFe7QLOxVqFox5QwnXQvk3i159KGwLn9EAwkqUYjLPq
         2uU1kNwUQcNzsnEwbaO67kTpx+Y2kbKetcf21/kSZlZfsZh8HKxGqmNQL8fr/5GyugGJ
         BtMcicNIr+mh+b3kvgTemUZHpu58D8CNonmr+WzLM6jO9CBeSj5oO/WTUcwbJR7lt3BR
         DlJ8Jgq45b7XT3N5ctfTf+9UCPMEECqc+d0/Gyf6SqsxJ9HMNrnP25rSRy7CKzavYvPh
         b/zlI3VCwqS+Jtve8q8mjTK+xJn8hpORYSlwQtvry+jqO0k/4zxiKDjkv5h7Xqv0Mx0b
         FsRA==
X-Gm-Message-State: AO0yUKXQ4S3O9dVU0pG2KELojoQkxdL2ySIsQ0zUcUgp0Te7ZysQLQzy
        GnbeBe1c2D4TlfYYsQy5H5ruWA==
X-Google-Smtp-Source: AK7set+XZjztAqy08RvDJEF5AIwYKnhRVayRSGDc+ZxlwlhiZ0Fze8YO4gSc7ha+LGEIU7hrTfHOhw==
X-Received: by 2002:ac8:5893:0:b0:3b8:29fc:6c15 with SMTP id t19-20020ac85893000000b003b829fc6c15mr1830580qta.16.1674827399227;
        Fri, 27 Jan 2023 05:49:59 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-6400-bacc-4546-b75d-3c88.res6.spectrum.com. [2603:6081:7b00:6400:bacc:4546:b75d:3c88])
        by smtp.gmail.com with ESMTPSA id p25-20020a05620a22b900b00706c1f7a608sm606998qkh.89.2023.01.27.05.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 05:49:58 -0800 (PST)
Date:   Fri, 27 Jan 2023 08:49:57 -0500
From:   Tom Rini <trini@konsulko.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Joshua Thompson <funaho@jurai.org>,
        Philip Blundell <philb@gnu.org>, u-boot@lists.denx.de
Cc:     Huan Wang <alison.wang@nxp.com>,
        Angelo Dureghello <angelo@sysam.it>
Subject: U-Boot support for M68K removal
Message-ID: <Y9PWhU7DVQCLP9EX@bill-the-cat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aELqizBjG24baikV"
Content-Disposition: inline
X-Clacks-Overhead: GNU Terry Pratchett
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


--aELqizBjG24baikV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey all (and especially the non-U-Boot folks / lists),

U-Boot has had support for the m68k architecture for practically forever
it seems like. Unfortunately, it's also been a few years now since I've
seen anyone active in reviewing general patches to the architecture and
doing the little things to keep it up to date and following best
practices. So I'm here asking, does anyone know someone interested in
maintaining U-Boot on m68k, for whatever platforms interest them?
Otherwise, sometime this year I'm likely to drop the architecture.

Thanks!

--=20
Tom

--aELqizBjG24baikV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmPT1oQACgkQFHw5/5Y0
tyyYeAwAjjFY4qNtGD7OhRu2jm3ULqpzVkOnL+EyuGilRIv8qkQM6nhklos/VzQH
P9PVRK0dSIikiBAdfSvf9VmtncZXDAb+/VL4PBO4XuiNZi/XrzQ5zX+cxFKqWz3O
C9UQqtGlP0edT3CxJVKAvLy6QvLupxwkaPT/8FwzvSO0HqSrjLAGk5UznXEASRbU
dahpWVRnsQ2jZvDx2OM6xGZTBusAGpyBGg/9+JYFlRa6VIashmH+QjLlrDLX7wUG
yEP7FmkokuKLWXW3Bmm87Rad8R2saS9DdjoTy6OeSTpfcdjux57CzE4apdnRbZTZ
eN9Jtp27hjIXXBccLcQpYCeEVt+3ChPCFTApJtn8aM4A685v8aVCdtDRRFxTNAQP
90M0Psu1dop8DdnfcfjmZAqEywQdn1OPWmdbeAmsuQ0EHLZD/jzTmiwZ1G2PcHlK
7uu+5L6vXkC0CaK7tJgv0ZGTLlm0YuniBwKgjwl6V+IMcZuborTnrqkKTwDjQCWT
n2IqtMg8
=KGfb
-----END PGP SIGNATURE-----

--aELqizBjG24baikV--
