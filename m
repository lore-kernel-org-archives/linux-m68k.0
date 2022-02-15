Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9153DC433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Feb 2022 09:31:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235891AbiBOJbo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Feb 2022 04:31:44 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233528AbiBOJbo (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 15 Feb 2022 04:31:44 -0500
X-Greylist: delayed 924 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 15 Feb 2022 01:31:33 PST
Received: from www.sophics.cz (mail.sophics.cz [188.246.98.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D24723EE
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Feb 2022 01:31:33 -0800 (PST)
Received: from gw.tvpc.cz ([93.153.54.57] helo=amd.lan)
        by www.sophics.cz with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <pstehlik@sophics.cz>)
        id 1nJtwI-0007yu-UH; Tue, 15 Feb 2022 10:16:06 +0100
Message-ID: <6073b6c3a46eef78dda3e6c522cba691f1ddbd16.camel@sophics.cz>
Subject: Re: Wrong colors on ARAnyM
From:   Petr =?ISO-8859-1?Q?Stehl=EDk?= <pstehlik@sophics.cz>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>
Date:   Tue, 15 Feb 2022 10:16:01 +0100
In-Reply-To: <CAMuHMdWkxDMbS4D8wkEPAVgrFnoJzejUkxKCnvA+MA38vS6g9Q@mail.gmail.com>
References: <CAMuHMdU3ievhXxKR_xi_v3aumnYW7UNUO6qMdhgfyWTyVSsCkQ@mail.gmail.com>
         <b03160b6-7f3b-7765-49ee-c49b7dd2c4e0@gmail.com>
         <CAMuHMdVUX0zJtRAtjCBAa7iEk7MwCjcmSsJdCrSrPcY=6ti=cQ@mail.gmail.com>
         <4b3a0bc8-24a1-2a33-19bb-fbae954c614c@gmail.com>
         <CAMuHMdWkxDMbS4D8wkEPAVgrFnoJzejUkxKCnvA+MA38vS6g9Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Út, 2022-02-15 at 09:11 +0100, Geert Uytterhoeven wrote:
> > Now what would cause us to miss every other palette update or depth
> > change?
> 
> That's a good question! Why does ARAnyM sometimes decide to use the
> Falcon palette, and sometimes the STe palette, and not only with
> bpp == 2, but also with other color depths?

just wanted to let you know that I'm following you. If you happen to
identify any bug in ARAnyM I'll try to fix it ASAP.

Thanks,

Petr


