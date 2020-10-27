Return-Path: <SRS0=8h3E=EC=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC6AC55179
	for <linux-m68k@archiver.kernel.org>; Tue, 27 Oct 2020 16:24:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A75F021655
	for <linux-m68k@archiver.kernel.org>; Tue, 27 Oct 2020 16:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603815861;
	bh=lCYQZNcVsX6/8ZBMIImKIWSw6Ugxug66zxJxFeK6D1o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Vp+UG8GTEYORoeWUtSXj7UHa47YVP8ohlnEdUyony5eEdCx3aaI2rpN5pJTNvbkjN
	 1L2JQ5GvmaC7RBwnOWK57bLEZLJKA9i5dib9R+dRIboW+7INDTFg+3Hqk0pHVR6Vak
	 egDLkY5bWQHpnwL0B1wwVHq7pRitgN87RXWsSPlI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1808880AbgJ0QYQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 27 Oct 2020 12:24:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:48570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1808876AbgJ0QYP (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 27 Oct 2020 12:24:15 -0400
Received: from localhost.localdomain (unknown [192.30.34.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 06AE921655;
        Tue, 27 Oct 2020 16:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603815854;
        bh=lCYQZNcVsX6/8ZBMIImKIWSw6Ugxug66zxJxFeK6D1o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GFhh4O5CjyyDsLO2BhXm5BuUBAHHuRsguzDgucmXFsIx5lAaoMnfju5oiHw8WX1/W
         qpiuJL3cOhezP31o0uyQScIqm/v0iWZQTqWLUbTckjAgeelS4/LaDazE3e3M8JSGJY
         Bp0f9I0zqOwR6NjTUTBE08RS8MvFgoWta0hTx4/M=
From:   Arnd Bergmann <arnd@kernel.org>
To:     Nicholas Piggin <npiggin@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Arnd Bergmann <arnd@arndb.de>, noreply@ellerman.id.au,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH -next] m68k: mmu_context: Fix Sun-3 build
Date:   Tue, 27 Oct 2020 17:24:05 +0100
Message-Id: <160381583391.399283.3338137504662576228.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201027081919.4010948-1-geert+renesas@glider.be>
References: <20201027081919.4010948-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 27 Oct 2020 09:19:19 +0100, Geert Uytterhoeven wrote:
> When building for Sun-3 (e.g. sun3_defconfig):
> 
>     In file included from ./arch/m68k/include/asm/mmu_context.h:312,
> 		     from arch/m68k/sun3/mmu_emu.c:28:
>     ./include/asm-generic/mmu_context.h:46:20: error: redefinition of ‘destroy_context’
>        46 | static inline void destroy_context(struct mm_struct *mm)
> 	  |                    ^~~~~~~~~~~~~~~
>     In file included from arch/m68k/sun3/mmu_emu.c:28:
>     ./arch/m68k/include/asm/mmu_context.h:192:20: note: previous definition of ‘destroy_context’ was here
>       192 | static inline void destroy_context(struct mm_struct *mm)
> 	  |                    ^~~~~~~~~~~~~~~
> 
> [...]

Applied to asm-generic, thanks!

[1/1] m68k: mmu_context: Fix Sun-3 build
      commit: 2040a6bf90b530165cc86dfa879d5daa3b85f220

       Arnd
