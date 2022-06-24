Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15015C433EF
	for <linux-m68k@archiver.kernel.org>; Fri, 24 Jun 2022 17:08:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbiFXRIn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 24 Jun 2022 13:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231767AbiFXRIn (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 24 Jun 2022 13:08:43 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B718651E4A
        for <linux-m68k@lists.linux-m68k.org>; Fri, 24 Jun 2022 10:08:39 -0700 (PDT)
Received: from mail-yw1-f182.google.com ([209.85.128.182]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MV5G4-1oCvUh3JkE-00S54E for <linux-m68k@lists.linux-m68k.org>; Fri, 24
 Jun 2022 19:08:38 +0200
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-3176d94c236so31082377b3.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 24 Jun 2022 10:08:37 -0700 (PDT)
X-Gm-Message-State: AJIora8xfy9WB9e45WJBzrbYUfyWtimdptM1jXYK5jWcoGFKl058s/Af
        TMY6oPzg9HHl76ExF3r2Mdhen0RYjCmGH+mwEjw=
X-Google-Smtp-Source: AGRyM1tBSdPwbFq9GZSjizWzVuAB7giujhHzzt55cTqkntbPy6yauQrkbaXTZ2eocC/Zbg06KphUioMdhsic93kqOWE=
X-Received: by 2002:a81:b93:0:b0:317:791f:3c0 with SMTP id 141-20020a810b93000000b00317791f03c0mr17394782ywl.42.1656090516599;
 Fri, 24 Jun 2022 10:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220624155226.2889613-1-arnd@kernel.org>
In-Reply-To: <20220624155226.2889613-1-arnd@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 24 Jun 2022 19:08:19 +0200
X-Gmail-Original-Message-ID: <CAK8P3a04C+ZavWb2nnYs-02CKZq10OA8rDE7QHMFF5qZzb6t9g@mail.gmail.com>
Message-ID: <CAK8P3a04C+ZavWb2nnYs-02CKZq10OA8rDE7QHMFF5qZzb6t9g@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] phase out CONFIG_VIRT_TO_BUS
To:     linux-scsi <linux-scsi@vger.kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Khalid Aziz <khalid@gonehiking.org>,
        "Maciej W . Rozycki" <macro@orcam.me.uk>,
        Matt Wang <wwentao@vmware.com>,
        Miquel van Smoorenburg <mikevs@xs4all.net>,
        Mark Salyzyn <salyzyn@android.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Denis Efremov <efremov@linux.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Gl6GbYLTTRbW8haxssB+Oee7ROItj6anuoIeyFC24V7JFP2iPBX
 BXk1Z35aUt224IBKcSiX4MxOyWX9fFWRaiv/LHBELPVu6vpQaXFYs+ww67ibtWMhtW+kFmr
 8QlWLwnKjlOVPL/kEkaotHipf4kFPgZDRR9Y4/+qmvORtZPEUvye+25/a7/kH1eNqRrPjQe
 poMI8VNjfAv1nut2jid/Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZkXhGPdprgU=:tWFasDDBzntafdECErZ0U3
 lVojytLWoALVF6czHYxHCM/fNc8UZsXrqdhrWwoXwgTPU6Yr5DqD466VkyVdo8X0e+qlVFnXT
 T9473qTPs6tL0gSlTxSIPEMCZtm592ngAFKnNZqXpe4kuzYY/51uBrlgIWhtcGfjXm8FZwtPt
 l030UXcFfZycSxipx9UYLp1RaOJzEk+/PZHtKYbICLGCa2XbLLf9nZh2tsigODJMUUyt6ZbuW
 euwe7WsHJmLpWvp6FSmkGX0aeFufXwzjT6MWJW3UU4KgHuEwaXjZeOu26YZ/XG4Lh9XQya7EF
 B8d/GGTPmZlabWtJXYTb6FN9VdbFZgIv0ADRkxsRIhxwybImxZdX4AakpX97t+q9kOXB7K6zb
 V8pctK/Od4oxOCafbwHcbG5p5KmYGssbko5hONsk6U3OFO+vBERq99t0QgWn85J7mufWXzKFU
 ogPRS8btrlnG/TvgCz50Nln0ZNU5rSV9Mjq4FQ1zc2TO5Rb846Lj75t56HTInSrUfi24bVm92
 obbLlWjwZzoRgZsBtW7i9dGB8+OwTjzE4o9QMlytDLgRRtUlsurQMqByr1DIS0mvpMwXIdO5e
 f50DPznJa+LYfqh/4hMo3ujaIUsKlVJTS0auUw/L0cXVsRkBVNgAezm9SBMn7VUjb++yRXKbe
 r/xVqEaQ6ZgBJ/5spg6M3s7WLIOQmZmtwnZHxLsMwWiXe1isv1KK97+Ok5ND+lAIQFljgF8yv
 FPTjaHZXZh5jRHXs52GEULqlLeCWpCYwAlioO9hkZmvwARsJz/sGJ+S6X6DFm+OE/oNe9u8dF
 vsXSe6wEtogfzkAkkqE7vlEdkFhztEk3rodmTMxlyb4vjyZg/LEAQSFzlfMgU7VAYxiloOfbX
 Ta/e02QEIDq9Mg5sRmIw==
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jun 24, 2022 at 5:52 PM Arnd Bergmann <arnd@kernel.org> wrote:

> Arnd Bergmann (3):
>   scsi: BusLogic remove bus_to_virt
>   scsi: dpt_i2o: remove obsolete driver

The dpt_i2o removal is overly large and got dropped by some of the
mailing lists,
if anyone wants to see the full patch, it did make it through to the linux-scsi
list at least:

https://lore.kernel.org/all/20220624155226.2889613-3-arnd@kernel.org/

         Arnd
