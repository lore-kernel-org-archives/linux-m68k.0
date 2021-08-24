Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194B5C4338F
	for <linux-m68k@archiver.kernel.org>; Tue, 24 Aug 2021 08:59:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F166D610C7
	for <linux-m68k@archiver.kernel.org>; Tue, 24 Aug 2021 08:59:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234237AbhHXJAM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 24 Aug 2021 05:00:12 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:59657 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235366AbhHXJAL (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 24 Aug 2021 05:00:11 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4Gv32Q4TTHz1sNcx;
        Tue, 24 Aug 2021 10:59:26 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4Gv32Q3kfcz1qqkr;
        Tue, 24 Aug 2021 10:59:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id WEzGEGWgpsJe; Tue, 24 Aug 2021 10:59:25 +0200 (CEST)
X-Auth-Info: 4MOQufy0mLZmXYf17UyGaqOITHe9l+J0YMSUdimue4SWNyItft1UB4v6hxBNBAFn
Received: from igel.home (ppp-46-244-170-245.dynamic.mnet-online.de [46.244.170.245])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue, 24 Aug 2021 10:59:25 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
        id 157442C0B90; Tue, 24 Aug 2021 10:59:25 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: RFC: remove set_fs for m68k
References: <65a95ae0-4734-68ce-ef71-7491b5534718@gmail.com>
        <8f470389-fe8a-90b0-19a5-68f85526b30e@gmail.com>
        <20210721170529.GA14550@lst.de>
        <a70d80f4-6034-e20b-26c5-76609c52c92a@gmail.com>
        <20210723051126.GA31274@lst.de>
        <e9fb28d4-405a-5cc6-b071-707a2edbce92@gmail.com>
        <8884e940-22e8-72a5-e9ec-f9b2628b6ef4@gmail.com>
        <251aa093-047a-b37c-4e88-d543c6fa8bc6@gmail.com>
        <20210815074236.GA23777@lst.de>
        <63c35a20-3eec-1825-fa18-5df28f5b6eaa@gmail.com>
        <20210816065851.GA26665@lst.de>
        <e705cfe1-4386-d205-89c6-73e13335c792@gmail.com>
        <7517d306-21ad-daa1-a2fb-b273211cb588@gmail.com>
        <CAHk-=wgEFfm61UP3tfkVthVoivsyo0m4c-HrKo7SP8fwZTn4tA@mail.gmail.com>
        <b211dea5-ec59-21db-4235-387d7983905c@gmail.com>
        <CAHk-=wib3p3rn+4YgS+dVVb=VciMGXJwGL-SiMY9QTytDMF08w@mail.gmail.com>
        <57501cee-de70-99e5-3a92-e5d2a515bb51@gmail.com>
X-Yow:  My life is a patio of fun!
Date:   Tue, 24 Aug 2021 10:59:25 +0200
In-Reply-To: <57501cee-de70-99e5-3a92-e5d2a515bb51@gmail.com> (Michael
        Schmitz's message of "Tue, 24 Aug 2021 20:44:31 +1200")
Message-ID: <87bl5n9q1e.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

FWIW, you should be able to download the full 68030 user's manual (as
well as all other 680x0 manuals) from the NXP website.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
