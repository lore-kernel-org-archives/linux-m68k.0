Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C174C433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Dec 2021 12:50:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236733AbhL0MuM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Dec 2021 07:50:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236732AbhL0MuM (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Dec 2021 07:50:12 -0500
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3332CC061401
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Dec 2021 04:50:12 -0800 (PST)
Received: by mail-yb1-xb44.google.com with SMTP id o185so17470096ybo.12
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Dec 2021 04:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Vj7cua5OEdtw2ToZDYKvCRwQBS28MZJv7XgODvwzOcI=;
        b=dhjOsuTH8DpE2U8Aay5qzIuTRWubezsGjM3PPL6QF8dlTOhd8l61wPU+othrJfIJ26
         vHo0hwI65jh9O/KEFER+NVUW16h/vqpnDiBhqSXMlF7wSXAqXHYoUAgevkk6WqHWT5sN
         puxn7Vvy9w5KlnyiBd9aBxHnH7nNoCCzDOrdj5CxzaRpbDrIuQ5SolxbLrNz86sYJks0
         B740ruzIYS5n8+Uf/OxHCGrDVQw6aE/fTblQdtR9n5mWPKKX6nXK3J1skKrQLwjBYdnJ
         JOWWoacg749aQYmAcCHiiZdNP0iL+ybhGRx58MJdoCKBHXV+LA+Er+WsKiSkR6u2uSrq
         sI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Vj7cua5OEdtw2ToZDYKvCRwQBS28MZJv7XgODvwzOcI=;
        b=enTza6u6DPDk0xpV+Fo01RBQjf8Eb179dn30iOIiYAd3hg6M3CLPzZvCkt59lSXr7I
         G1ZYne9DT+NK7a/y/BAg3XbFl3XzEcl5rMgtVaPc1KwUkbpLOKQWaH3I5DkHT0b0OzsA
         Nl+sBHl46ACn4RA/Rt7xP5FbcAYhbuf8RX3Lb+10fLesSB9tfAsU2+b7CskBO1ueUM69
         fnjxvH72N+PMVhMJ7982/RlMjHyc1Sr0XJ7TETdaMoEwkjEy5CzMrbz3JSjF8EwkvsMq
         Tmt5Pkm82gxeMtenFbeCxIjgiarvsH3m9Mujd+4D5zNminRmPAVbivwzJIXyDHbe2hk0
         xjeA==
X-Gm-Message-State: AOAM530YlBU6zF66TSLJLr+jBojdQ5WxL97ksvktfsH+AlZKSiNl539R
        4yB6yVMvpmnwKIQws+duYGI6dIzP16IDq6l+dFg=
X-Google-Smtp-Source: ABdhPJwu/mEK81ysFeDrijkemQctNZEH/58rJAwEZIX6CaL44ocLBALzJVpJccr5TyQDBK30z+Pesu3fneHIE1irS4E=
X-Received: by 2002:a25:2e4c:: with SMTP id b12mr6033168ybn.569.1640609411418;
 Mon, 27 Dec 2021 04:50:11 -0800 (PST)
MIME-Version: 1.0
References: <20211227090917.35838-1-hbh25y@gmail.com> <87h7aus8v0.fsf@igel.home>
 <CAOo-nLJG71QqqD0-cJDyH0rY2VTx1eO9nHVQ5MCe8J0iiME_vw@mail.gmail.com> <87bl12s1ky.fsf@igel.home>
In-Reply-To: <87bl12s1ky.fsf@igel.home>
From:   Hangyu Hua <hbh25y@gmail.com>
Date:   Mon, 27 Dec 2021 20:50:04 +0800
Message-ID: <CAOo-nLLSsKd3BFEN=2spk2QZJ-_aCkBzU2kjShxibXqKGx+7Qw@mail.gmail.com>
Subject: Re: [PATCH] m68k/kernel: array out of bound access in process_uboot_commandline
To:     Andreas Schwab <schwab@linux-m68k.org>
Cc:     geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

You are right. I will resubmit the patch later.

Thanks.

Andreas Schwab <schwab@linux-m68k.org> =E4=BA=8E2021=E5=B9=B412=E6=9C=8827=
=E6=97=A5=E5=91=A8=E4=B8=80 19:56=E5=86=99=E9=81=93=EF=BC=9A
>
> On Dez 27 2021, Hangyu Hua wrote:
>
> > If we don't use
> > commandp[0]=3D0 in len =3D=3D 0,
> > than commandp will not have a zero-terminated.
>
> That doesn't make sense.  There is no room for the zero.
>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint =3D 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC=
1
> "And now for something completely different."
