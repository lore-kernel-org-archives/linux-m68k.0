Return-Path: <SRS0=Hd0i=DO=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D826C4363C
	for <linux-m68k@archiver.kernel.org>; Wed,  7 Oct 2020 08:54:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC1F121D90
	for <linux-m68k@archiver.kernel.org>; Wed,  7 Oct 2020 08:54:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbgJGIyj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 7 Oct 2020 04:54:39 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:36623 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727118AbgJGIyi (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 7 Oct 2020 04:54:38 -0400
Received: from mail-lj1-f181.google.com ([209.85.208.181]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N3sye-1kYqg03PEm-00zjhI for <linux-m68k@lists.linux-m68k.org>; Wed, 07
 Oct 2020 10:54:36 +0200
Received: by mail-lj1-f181.google.com with SMTP id r24so1178987ljm.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Oct 2020 01:54:36 -0700 (PDT)
X-Gm-Message-State: AOAM5334cdmKXRVP7Tqo80jZtVqV7BBuSMAc8MN9tKMHsjq5Dbad6PTa
        WJQDuQ7Ue3XQBYOUmP1qPBQOs+5rGKLfhJ6HQVo=
X-Google-Smtp-Source: ABdhPJyu4xMUiED6tphuvJBDmrMqYuzph3Rbz32Jq9pG9Bet45lBRMBSkcwUI4qjIUAVco1htJKz2ohJp7aKLcNUE6w=
X-Received: by 2002:a2e:9c57:: with SMTP id t23mr791138ljj.189.1602060876152;
 Wed, 07 Oct 2020 01:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201007074447.797968-1-hch@lst.de> <20201007074447.797968-2-hch@lst.de>
In-Reply-To: <20201007074447.797968-2-hch@lst.de>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 7 Oct 2020 10:54:19 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0UHEsND+vJjhtj2GKQpMjMCqD55vQ9+2u-SCrThe3wTw@mail.gmail.com>
Message-ID: <CAK8P3a0UHEsND+vJjhtj2GKQpMjMCqD55vQ9+2u-SCrThe3wTw@mail.gmail.com>
Subject: Re: [PATCH 1/3] fbdev/sbuslib: remove FBIOSCURSOR/FBIOGCURSOR leftovers
To:     Christoph Hellwig <hch@lst.de>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "David S. Miller" <davem@davemloft.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:8cNLiH4msHlNuB+a62Q7QkVhYUduI2xxcujuKiwGVR4+UCaSOu4
 3OHQanYCxIgLvJ4KjtWqZxLhxesnn3Fg3C7iPG6sENNNXiOkA3VvFLZjg43KkabUz12m/ld
 8FHHXnaePkEI/hAWSgNnUBJS8FfWfEQHivwe7sy7MFutLGHsngka1XJQu7aukHOYTjUc0fp
 h1Q/d3N+mIk+eAtinX2CA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MfArK/TSfS0=:RJrEKVy2lLgIG94g+BRUhB
 Xmj57ygyjTccgbRdcM7K8I8F3A7zKVdW4xY1BMrBwZf3TotfBli3T8ZC6/TGNoV40nrOm3P78
 zTbjRoI+RpBAdGVfi5vR6ZSmYofW7aVuDSGLx/GyyvwSv9dcEzybt8pHHWOTRwc/NBgFI9eEp
 t4Zzt2s/BWzvghK6ZZNiP3pAX95yQi6Aw4cw2nywyFbR3gFlwuKwuq0NEEwyjwmMQdLZgcWYe
 FQ30mskAT9pJRJ4ujkXfIKjMIRH9dABHFnL0h53yKlCH6iX1ONHgb8O8U1H+h5jHPflF/hxs0
 zevIAqmbOZEi5nhLhfDj8k3me/D/AErioQWzjKPnSFwsNoQR//vzypRmFAzSiToieIn1+b/Tq
 GrXmXCnqfnyePedONAe3Fj2VLO3Ohlp1F651Subs0sDXftcbVbtX6qjia6UFX/7H+t/FjOrD6
 bm2gIo/9T2+6w0eipoeETbq4f7M+D8Bgv12tHfkHfcEHDsg8So7SLvXpVT4ahrxypj7S8L+Ww
 eREzO52m29hfh2eC2jr2796qi+w2OQ4FkyoITo+u0d7vAcvJt5+gX+JOU/PJcgEXFJrSsDQQN
 4eZbLrmVikWEF+gSav2HNtvINtD/Jdath5GtCYORwy7I60CfUHS8BzJdMIvCtwzcjq7Db5/3+
 2QtWfdJOde5Lu0PATVRXyABeP6DBcfOTvTb/dkZUKDCI6720Ur3VFmemaZBeb6lnzFyc1kW25
 uVHKo6YrfB0YYJjiDoOR4sI2147xyzP8RgmSuFZZao53kGPZXhNcBb8r/R5tzDArbjEEtnibL
 JI29FHO8CO7SjPVRE07QHJNsY9vJFDvF1oFDJ6GjC4t6aTm4Cs2VJlHEtVemew08gMvFclt
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Oct 7, 2020 at 9:44 AM Christoph Hellwig <hch@lst.de> wrote:
>
> There are no actual implementations of FBIOSCURSOR/FBIOGCURSOR left, so
> don't bother with a compat handler for it, and remove the remaining
> definitions as well.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

I had submitted a similar patch earlier, and Sam Ravnborg applied it to the
drm-misc tree, but it doesn't seem to be in linux-next, so I don't know
what the state is.

My version only removed the compat handling, not the data structures,
so I'm happy to see your version used instead if mine got lost.

Acked-by: Arnd Bergmann <arnd@arndb.de>
