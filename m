Received: from mail-yx2-f27.google.com (mail-yx2-f27.google.com [74.125.224.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CE32D592D
	for <linux-m68k@vger.kernel.org>; Mon, 28 Sep 2026 23:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.155
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790639109; cv=pass; b=N81WFeSes8a6nfSPKVdhhAboK82DR10nPY3RXu7YzfHa9vUpCpCbPv89k5EKauCWXS5rTxNmQ7R5io8Onr1XY0adNJFB/IvxpZ9+xGE0TIF7sTbzzC8J9f9Lxny21rNQSZvh3/44+o6/d5eeKTWjgwkENMkwGZMZ+GpLt8SDWz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790639109; c=relaxed/simple;
	bh=2dW3KjRO43zQyQhXJDYouu00AL6Lvrd3NzAIkU41sfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZdmTUIzgqRAWZGGyFPveLxAsKnqAky0fFCq85SxSttA+z3i0AnmSKi2+wGSz6juNmd3dbiC3tN0Z35EGJJAGj1Jkjnn20IZrNeoWbYknjmbbpfg3NKI183N1+atKKlp00Lco8hQiy68XTNOqTd3Y2xnP5fsNIV1JFNW0Yf3LXfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rpr28FAy; arc=pass smtp.client-ip=74.125.224.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rpr28FAy"
Received: by mail-yx2-f27.google.com with SMTP id 00721157ae682-895fd505832so30942967b3.3
        for <linux-m68k@vger.kernel.org>; Mon, 28 Sep 2026 16:45:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790639107; cv=none;
        d=google.com; s=arc-20260327;
        b=rZaC+hLBVYac6A9JWsQ0MB5YbAVO8bLmGw8kr5LIskbd1ZMx2SVyCu2yWrUGVBc+Oo
         XO00Ti847V+yljIYk8CENJCY6O7KMcGKbdNwU6mYxpaE8rwj8M8LdeC9oN1b22YUvNup
         dZ8X1LDOCAf0cQ6Kj8UdZ5nf1lsqZza4QJEgpiKJLGr1+AxvZzES4DJFceKHjB1jEqYf
         mE2CZDs369ycBVQhnH3FNf2Buw6yy5W7drBMrdOYZXRA+jEZWqCNIqKn7+AheZH+QTsV
         oWo1N5jYNuAsfijgatta+/cWyosd7IyI76ZbJpg5f0xti/ZwRa9/u28d1vwspiJnWUkC
         ZFyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2dW3KjRO43zQyQhXJDYouu00AL6Lvrd3NzAIkU41sfk=;
        fh=1x5qhT+h2nyp3WxCHFr6rfzVGvxmJaCsmS5KP4BFJak=;
        b=HBu+aAMzzu3jE0lkXNVPebQO63V+MUHf1ZfowAPqq7fnsCuzemIXWUn+8wTDsJEgCw
         gQsBOhddZ0yXrlGQeGXR3ZEEFZ0Fh4YpSHaIRDkwubP11oNaaHhjkaUpzhNYcWuioUbq
         vTqAnZzA6NNXVmGAtB4p7GWoa9CW6TjZUnHDlRyhbBfGYNBcvwFtr/n+/ee6uh0LD9vH
         4iXG5g14EqKTrsxY4lTihglQfvgwcXeb2xGCKfAkbBOsyCPlfhoqqatT70KTXRKDj7zK
         8vJG53tMHxLuF8YJcwKMnwlN+MhTwgp7naDKa1O5wuKSC5TO9we5nFdt5jRuSaQJjBUW
         KmeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790639107; x=1791243907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2dW3KjRO43zQyQhXJDYouu00AL6Lvrd3NzAIkU41sfk=;
        b=Rpr28FAyMEEPF1NfMPgZSnN16YJdezL7Dn8o/1qL9a0cBQ92Cex1nyM02hxFNkatTq
         mehEk29eV/piFtd+8XQ+y15tKysjtmRUAHqUJxfiwg4cyWUzIUOIwWCHyWNWkYi+zqPc
         G6Xaa/Vs5I7v3racNIA1A+N6/Msbq7EGKfHr0n70Df0ZfXaUqTbq6qz9FtOe0GbcJ+m9
         CxISC1wIA+B4E1epnXVD906d++RRPyZQRgmxWrHXkhcSniUjIsINMHDX/Q45pXCdC/8k
         vDt6yj/pOJV+LCc8MYTfKUpGUzHTNH/NcKAYRQTojht2mcPq6alcYXhNe1IKqH0HIEF/
         hsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790639107; x=1791243907;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2dW3KjRO43zQyQhXJDYouu00AL6Lvrd3NzAIkU41sfk=;
        b=vgResQyCUwQd+8nUkCBfq8YrGlYCR8MpLJ5X1rQSPEEQmivQ+bIzGnuBbwSko7g6Fj
         4SojTlXkfwsWLFq8ZeQrQsGzyFuk+/RapsjyPWwy1gyujmI3NmxQkmHt16AmkWA1kkkG
         gF6AFHE73hCarwRBB+1JGfY8LpeOdqalrqxplSk4Z+aZtffp8JanIVzebX7BMVopYVsx
         zmlqRjWHN6cBY7cwU93KI8qaX3CqKWLUrlR87DWuL8DrB2j4EN/GAJHWm2G18nHIlxQM
         0kLtJKSHyW5urdgv9dERMGLhZm2LCXW8OFNYHQR0/71llgC8n+HAdR4xyxfcMLaDbddp
         DqxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMjZyuS8CqRRYFnbcYXD6mb89sOWe39DqDehszm+76/zGVeGlGS2KE5JxROcsyyLzMhXwNE6A37Uc9@vger.kernel.org
X-Gm-Message-State: AFq9FYLtOeYOPESukZaTsL+je7dZJK7WR1oEr8BzFBt2m3oba+VIQiZC
	AT8msVLcKSUmglMMDA2GJUSgx12xsPqe2YPfaA/ntE7seBS84JTPXa1KyL4KhMnEuuqrx1Q3QBu
	xydilV2f0lGr3WmwAOq6VYkm4bn8O/iroGQ==
X-Gm-Gg: AYBFou3UWtRkSS7I+EQlb+/RxmtUaRjDpsutQ8F1ekoWzmOnIwJypAoy9fgRlv+22QX
	58TOaCTZYUI2IYwXZhgtTbNhDA7fq5k0+ANbNfksqBiSOA8gpMvCun5Ksf13BSg2lZV7oFkKSus
	H4cd6isGwFP/P33rfrI570K8PMlIUD3r/6DUT3eXgKP8ZQYh/ZdbidWD8K4ISQdMz+rcrrZJ16V
	qEmmRbjj+YWItaW4oH3NGJqpM9HVu8tH3LZ5rKIJtYLBTK6ujWGK8GfqBaRQrvMkLwGua/CpgnV
	2tLPfQyGKcSluLNQmuIIYG33nP3A0yeA0JfQFElhCv6WRLgxAgiRnJZcdcWVPbCKq8DVrToR9uP
	XvXnW7QeMmRQ6n00f30rj7q7ONrEgOBLaI9jFRjoOzmj0GxOLUxO56qJZEvKWBhBun6IkORcmvJ
	EUsPVoqS7wxPKq2qsSqB/fE30lS/w0f1Bdic6QBI512n2XHp77geutQw==
X-Received: by 2002:a05:690e:4084:b0:674:170b:cb2d with SMTP id
 956f58d0204a3-674170bcdc6mr4003364d50.74.1790639106668; Mon, 28 Sep 2026
 16:45:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814031745.17140-1-schmitzmic@gmail.com> <20260814031745.17140-2-schmitzmic@gmail.com>
 <CAMuHMdUDvsqT5t93-ZO413pwS3rPYPB1_uy+5iRHsii8CYTdgA@mail.gmail.com>
 <ef9e0128-6309-546a-715a-3e7eb476910e@gmail.com> <8c7863da-299f-8c77-0727-fb438467a7ba@gmail.com>
 <CAN5rfbQMTtcvmcgbDwhTQ-D9AGxP5yGqHc=JWbN7PPJXXKPGHg@mail.gmail.com>
In-Reply-To: <CAN5rfbQMTtcvmcgbDwhTQ-D9AGxP5yGqHc=JWbN7PPJXXKPGHg@mail.gmail.com>
From: =?UTF-8?B?TWlybyBLcm9ww6HEjWVr?= <miro.kropacek@gmail.com>
Date: Tue, 29 Sep 2026 09:44:49 +1000
X-Gm-Features: AclHuK9mefzTsnWcGVGq7BKDMJ7VEQKK0e6FJ0Ob2zlKdQoMEB8M1aNeQcESDS0
Message-ID: <CAN5rfbTSiRqo9V1yscb04yckJxQ2z=4VP+G__4+kbTDXeGbj-Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] m68k: Fix atari mouse movement
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, 
	linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

this patch still seems to be pending, i.e. I can't see it included in
any of the trees. If there is something more you'd like to know from
me, I'm happy to help.

Thanks,
Miro

On Mon, 7 Sept 2026 at 19:39, Miro Krop=C3=A1=C4=8Dek <miro.kropacek@gmail.=
com> wrote:
>
> Hi,
>
> On Sun, 16 Aug 2026 at 15:04, Michael Schmitz <schmitzmic@gmail.com> wrot=
e:
> >
> > Hi Geert,
> >
> > Am 15.08.2026 um 11:15 schrieb Michael Schmitz:
> > >>> --- a/drivers/input/mouse/atarimouse.c
> > >>> +++ b/drivers/input/mouse/atarimouse.c
> > >>> @@ -70,9 +70,12 @@ static void atamouse_interrupt(char *buf)
> > >>
> > >> Alternative, you could change/restore the function's signature to ta=
ke a
> > >> "signed char *".
> > >
> > > Agreed, but without a way to test this, I'd rather wait for Miro
> > > confirming that change also fixed the issue.
> I have just tested it. The new version works equally well,
>
> I have just noticed that if I enable the pointer signedness warnings, I g=
et:
>
> make ARCH=3Dm68k CROSS_COMPILE=3Dm68k-linux-gnu- KCFLAGS=3D-Wpointer-sign
> arch/m68k/atari/atakeyb.o
>
> arch/m68k/atari/atakeyb.c: In function 'atari_keyboard_interrupt':
> arch/m68k/atari/atakeyb.c:263:82: warning: pointer targets in
> passing argument 1 of 'atari_input_mouse_interrupt_hook' differ in
> signedness [-Wpointer-sign]
>
> atari_input_mouse_interrupt_hook(kb_state.buf);
> arch/m68k/atari/atakeyb.c:263:82: note: expected 'signed char *' but
> argument is of type 'unsigned char *'
>
> I guess this is expected but wanted to mention it just to be on the safe =
side.
>
> --
> http://mikro.atari.org



--=20
http://mikro.atari.org
