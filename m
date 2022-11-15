Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AB9C4332F
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Nov 2022 13:08:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbiKONId (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Nov 2022 08:08:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbiKONIc (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 15 Nov 2022 08:08:32 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5A027CDA
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Nov 2022 05:08:22 -0800 (PST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 2B3AE1F8C6;
        Tue, 15 Nov 2022 13:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1668517701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jy0g+SAsWGq8sRQnucoaXWL35lEmu7z5lnE3gvmVRnA=;
        b=RS0rf54rExoOTJvsSM526LUnOC/hHdQNU4ydbFnqlO7PRqvfWliaFUQ6loxaOtG39bl1/Z
        qlPq95nO8N0AEGcDh+D38LNn8GzkpHy8TcgD2Gxm/48ENeSCZW/RWokpv9Gpj7xKJAj98Y
        Izg4dC/1rahbhidGzgUuXC/l8BhajmE=
Received: from suse.cz (unknown [10.100.208.146])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id CC7372C142;
        Tue, 15 Nov 2022 13:08:20 +0000 (UTC)
Date:   Tue, 15 Nov 2022 14:08:20 +0100
From:   Petr Mladek <pmladek@suse.com>
To:     John Ogness <john.ogness@linutronix.de>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH printk v4 22/39] tty: nfcon: use console_is_registered()
Message-ID: <Y3OPROSDSsXcWWte@alley>
References: <20221114162932.141883-1-john.ogness@linutronix.de>
 <20221114162932.141883-23-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221114162932.141883-23-john.ogness@linutronix.de>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon 2022-11-14 17:35:15, John Ogness wrote:
> Currently CON_ENABLED is being (mis)used to identify if the console
> has been registered. This is not reliable because it can be set even
> though registration failed or it can be unset, even though the console
> is registered. Use console_is_registered() instead.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
