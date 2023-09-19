Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C70C5CD3433
	for <linux-m68k@archiver.kernel.org>; Tue, 19 Sep 2023 02:13:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230459AbjISCNS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 18 Sep 2023 22:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjISCNR (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 18 Sep 2023 22:13:17 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CC2B10A
        for <linux-m68k@lists.linux-m68k.org>; Mon, 18 Sep 2023 19:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1695089583;
        bh=yK4i0fyc5ITTA94RNhwm6rcVMib+w9bmcMtOgracjcM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Qgq3yOvs6gGgFR80VJ38hn9Cwo84MntwgzdO4oF59tS94tUSQ+ttUeM62Md9g0evl
         QwxqqXHzTm0ZtXxHKOmH012krt4g6qLXwQqCcACUN9RAEK5rUwACqiaf7RoMw1FOyl
         ZTwD3Xgl+uCB5EB82Miw5QQLBETwXpqUklZDJebz8yRAPQJnNJnUKjdUYGFd6CrHGL
         aPdh7qQ2Zmpjb0XdtHZNfc/vJrR9SZ/u/U8/lKWQKBanezPW8J2OSuHQbaxR7IPbBr
         a0T9M2Y6rySu6F95/tCoaF9JDGhU28j1/sxXlCznmtM34o3lt3q8+k2toEAfmN+E5g
         L4oylx7S2wosg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4RqQDZ3JWCz4xDB;
        Tue, 19 Sep 2023 12:13:01 +1000 (AEST)
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
        linux-spdx@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 2/2] powerpc: Replace GPL 2.0+ README.legal
 boilerplate with SPDX
In-Reply-To: <d91725ff1ed5d4b6ba42474e2ebfeebe711cba23.1695031668.git.geert@linux-m68k.org>
References: <cover.1695031668.git.geert@linux-m68k.org>
 <d91725ff1ed5d4b6ba42474e2ebfeebe711cba23.1695031668.git.geert@linux-m68k.org>
Date:   Tue, 19 Sep 2023 12:12:57 +1000
Message-ID: <87h6nqlxli.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Geert Uytterhoeven <geert@linux-m68k.org> writes:
> Upstream Linux never had a "README.legal" file, but it was present
> in early source releases of Linux/m68k.  It contained a simple copyright
> notice and a link to a version of the "COPYING" file that predated the
> addition of the "only valid GPL version is v2" clause.
>
> Get rid of the references to non-existent files by replacing the
> boilerplate with SPDX license identifiers.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

LGTM.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
