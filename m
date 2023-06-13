Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A98F7C77B7A
	for <linux-m68k@archiver.kernel.org>; Tue, 13 Jun 2023 06:53:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239929AbjFMGxi convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 13 Jun 2023 02:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235185AbjFMGxg (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 13 Jun 2023 02:53:36 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E731810C2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jun 2023 23:53:35 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="421837502"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="421837502"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 23:53:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="776696836"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="776696836"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga008.fm.intel.com with ESMTP; 12 Jun 2023 23:53:34 -0700
Received: from abityuts-desk1.ger.corp.intel.com (abityuts-desk1.fi.intel.com [10.237.68.150])
        by linux.intel.com (Postfix) with ESMTP id DE88E5804FA;
        Mon, 12 Jun 2023 23:53:32 -0700 (PDT)
Message-ID: <d062dd7b09006c2d9988d92192952c65e66cf009.camel@gmail.com>
Subject: Re: Status of affs support in the kernel and affstools
From:   Artem Bityutskiy <dedekind1@gmail.com>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        debian-68k <debian-68k@lists.debian.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>
Date:   Tue, 13 Jun 2023 09:53:31 +0300
In-Reply-To: <baa520109ab3a13d1ac8aca1c9b8eaeee070c241.camel@physik.fu-berlin.de>
References: <baa520109ab3a13d1ac8aca1c9b8eaeee070c241.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, 2023-06-13 at 08:47 +0200, John Paul Adrian Glaubitz wrote:
> Also, I noticed that Roman Zippel actually created an affstools package [1]
> back in the day and I wonder whether anyone has any experience with it. In
> particular, I'm wondering what »different mkfs.affs« Artem Bityutskiy is
> talking about here [2]. Is there an alternative tool for creating and checking
> affs filesystems?

Hi Adrian,

I apologize, that message was sent 10 years ago and I do not remember details
any longer.

What I do remember is that I was doing some cross-filesystem changes and
struggled to test AFFS. At that time it felt that AFFS was abandoned. But I
remember I managed to create an AFFS partition, mount it in Linux, and test my
changes.

Thanks,
Artem.
