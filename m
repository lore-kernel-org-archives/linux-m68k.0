Return-Path: <SRS0=TiHb=BF=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5DFC433E0
	for <linux-m68k@archiver.kernel.org>; Sun, 26 Jul 2020 11:05:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AAAB2064B
	for <linux-m68k@archiver.kernel.org>; Sun, 26 Jul 2020 11:05:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727892AbgGZLFg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 26 Jul 2020 07:05:36 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:49724 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgGZLFf (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 26 Jul 2020 07:05:35 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4BF0Tp0CQyz1qrf4;
        Sun, 26 Jul 2020 13:05:34 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4BF0Tn6qmZz1qw6m;
        Sun, 26 Jul 2020 13:05:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id 1JJ8epNcqTQd; Sun, 26 Jul 2020 13:05:33 +0200 (CEST)
X-Auth-Info: u1X8FQZ6yuNCdFinUpizOCq+xFxz5nWe+3QRDAqndm9OtUn8dgjwq9CoqVi4523L
Received: from igel.home (ppp-46-244-174-182.dynamic.mnet-online.de [46.244.174.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Sun, 26 Jul 2020 13:05:33 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
        id BB4412C07D8; Sun, 26 Jul 2020 13:05:32 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>,
        Helge Deller <deller@gmx.de>
Subject: Re: Seccomp support for linux-m68k
References: <cd3ff9a1-030e-1e34-3950-99088ef81be0@physik.fu-berlin.de>
        <5642df4a-be8f-01eb-63c1-b5b4d75fa9d0@physik.fu-berlin.de>
        <06f3ccd0-3567-5905-eea0-80fb18206648@gmail.com>
        <b0d75d13-e241-43a9-30a7-46330e68cf30@physik.fu-berlin.de>
        <ee076f6a-143a-9f6e-7bbf-51112d64ab00@gmail.com>
X-Yow:  ..  hubub, hubub, HUBUB, hubub, hubub, hubub, HUBUB, hubub, hubub,
 hubub.
Date:   Sun, 26 Jul 2020 13:05:32 +0200
In-Reply-To: <ee076f6a-143a-9f6e-7bbf-51112d64ab00@gmail.com> (Michael
        Schmitz's message of "Sun, 26 Jul 2020 13:34:34 +1200")
Message-ID: <87sgde5yf7.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.91 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Jul 26 2020, Michael Schmitz wrote:

> OK, that's -EPERM. Reading the comment in asm/errno.h, -ENOSYS is not a
> legitimate return code for syscalls to use.

ENOSYS is the correct error number for unimplemented syscalls.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
