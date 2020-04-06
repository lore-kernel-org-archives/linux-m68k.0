Return-Path: <SRS0=JkFh=5W=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E7C3C2BA18
	for <linux-m68k@archiver.kernel.org>; Mon,  6 Apr 2020 03:54:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F3E0B20738
	for <linux-m68k@archiver.kernel.org>; Mon,  6 Apr 2020 03:54:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPa6r4Wi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgDFDyY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 5 Apr 2020 23:54:24 -0400
Received: from mail-wm1-f52.google.com ([209.85.128.52]:33229 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbgDFDyY (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 5 Apr 2020 23:54:24 -0400
Received: by mail-wm1-f52.google.com with SMTP id g21so754872wmh.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 05 Apr 2020 20:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=OF63QkZqVkExyyI80mRjl+Vsz3x0nub+LQr1d6lEg4M=;
        b=bPa6r4Wis7Fvw6eNDVjEqKMGo3l9Idx8IrEfp+ljZq6z3xDpvIw+V1Z5bNVQ3E2DbQ
         cLpo4yg/WKV8x+xGK6LOGzlJ8x2PQp4IsfUmj2wMl+JvAgg8k2UrCjS8RqwNZ5RjZkBr
         NAOqv+Q6VeRFpjBxstRLas3thXEKPJjWzmVH8iyVWtTGeWQMt4dfxVv3u3c1m3vvo/Tp
         fC3dtZAu8z2zS/+g/buJVF+PSJc7jsU7GPMVAuLT0y4Jicpr/OGXX9naCgU02tfqV6E+
         zMwOKaqZAZqqhVGq3TiCKdiAfoZZQM1YBk6/zrc4r86g6aJOtEUaXsoYdSNRoa5GjMoh
         QNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=OF63QkZqVkExyyI80mRjl+Vsz3x0nub+LQr1d6lEg4M=;
        b=HBBHcLrmcDoaPsETfmfVMEM3z4/C/C+SOSjt6xpQgOpaCCLHrLD0nD7fJD0X8HmeYe
         +2nr7J3FVxNIgY8lWhO8P7u/W9Y3OS+Bueenoga6yOcxFiRpljLdD/b+kqI/ep5sepg4
         46Ad2RFgL8kruEbtKiuwRVViDRB5E7o7LgLRPSmfPu4KQvkgpZkphH4o2/iJiPYwm7bn
         K0i1bcXsoxkaQWl8yIUAv/6aL48gg+kwWl0PUkOL9crf3uYlM9np9GOTN3xoQ59SUhMi
         39ppOX0LN/SnRzaN0lKwRx2M+EDZb8do2J1EQbnRvd4yAFg5KLCzCzpr88ThyuSXvB5b
         YudA==
X-Gm-Message-State: AGi0PubOXGhtVVRVXuBlSD7IMKjQ46rYF+NRJzHD/xZO2sH4Tun1udXo
        c4TxsA95lMYlQuMcNq12G46p4MjrFrdwXMvf7Sj8q2arOa4=
X-Google-Smtp-Source: APiQypLnJxtCQGgnghB2OJeb6ssvv9bL1Oh5odvUHskEEmoHlsgcEb6zPsdIhXWTNdOuSKTdx3KCdu6kb+r/XcWsFPw=
X-Received: by 2002:a1c:7707:: with SMTP id t7mr19835533wmi.173.1586145261862;
 Sun, 05 Apr 2020 20:54:21 -0700 (PDT)
MIME-Version: 1.0
From:   Stefan Reinauer <stefan.k.reinauer@gmail.com>
Date:   Sun, 5 Apr 2020 20:54:10 -0700
Message-ID: <CABq5eXFO1XWJcj5EZ97izZdcOJd+BD2mTV_vFnp4v6SxR7_wKA@mail.gmail.com>
Subject: A4000 reboot hangs
To:     linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi,

Is anyone else experiencing reboot hangs on Amiga?
My setup is A4000D, A3660/66, ZZ9000

I can see the last message before the screen goes dark and the HDD LED
stays lit, but the machine never gets out of reset. So I currently
assume it gets stuck somewhere in arch/m68k/amiga/config/amiga_reset()

[ 1741.620000] reboot: Restarting system

I currently have to use the old IDE driver because the new one does
not cope with my SD2IDE adapter (waiting on a different drive). Not
sure if this is relevant at all, but I assume the HD LED is more
coincidence rather than root cause.

Stefan
