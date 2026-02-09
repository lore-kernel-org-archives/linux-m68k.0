Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC60318ECE
	for <linux-m68k@vger.kernel.org>; Mon,  9 Feb 2026 23:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770678002; cv=pass; b=qnlZ3T0s8mDf1ROXIH26/v9kM2y2/uCYXH3CPR94Mf8fNOoYuuZIyqL/84nq5A1WBDAVuO+onEg9leA87wqgtD++teH+QffhY9GNYQBqppli+KW0WcyEAPEiGCVKh/5SJrMbBRCnEwXlQpfNBHl5wP19BgfJYW6AEFA2YjCf+Zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770678002; c=relaxed/simple;
	bh=e8PEklr7uWCqxR5kWo0UrXRis5wQ5nh0+7wTqaw95yo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tpNmq68f5E2PI2YGePK6zAAQsi7GJb+OTtQvM8txl7kTEfDh5bayIBdxLEpE6lFNmuul2P3vTleJrUTybqyiYNVcio0nxLVZ1+48jo/wyv1ZGvh3aQPdKM6y/QxbWZw8cx+7RKO0EXV+GzfMuKh7nEwFPeCoBI62Xx6YkIKxKes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fi4QVJbA; arc=pass smtp.client-ip=209.85.219.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fi4QVJbA"
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-89545bd3324so42109206d6.1
        for <linux-m68k@vger.kernel.org>; Mon, 09 Feb 2026 15:00:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770678000; cv=none;
        d=google.com; s=arc-20240605;
        b=KIntRazgpiomMzhvBiLla+bLNd4QJE9XBvzxnlRxLLTP3wp0mIV3rGr3WYWRj2QiQW
         /Br9Deu81/k+oNAJLo1hUXjvGAjqSlod+J+Zg4vAV1vsyu24vy3stNhuNNxucv0I/9ac
         px8rmJULqQgmjYoid35g6CtWFxVG+tzFGgw6AMtzV9rm4V/TxnKLJims4DnxPURNOqDc
         bntDnzDB0+zu9FyQSCUjugQb+jx+v2E87i4zlgMwkSH56lvtEv/H236wFWBHakuIwnxe
         rHdM3HfNKZ6vqwQHph7Be07Obm7Wj/Qknn57nFrdEdJ9Ff3ThaEg9Anp3XYUqKFsP9Bn
         2RmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X6Au6xV8PRd/zxZsbngEl9JrlNyZSnCE+btODQUCmyc=;
        fh=MPBOpLZEI4IJMIKAAj/Gjb4R9sQDWcCDFl1Ntr54auc=;
        b=dxzZiqF45AZ8JyDYS0e1rg1bydclhewG45dv7/Qc/Pgl/rNElaahH3sFBsXH1uIBn1
         8cneRJsoFbqtkceXUALbrShAsjFqKwBkYm7Rqv0ZYqXMg+/bXII5F/IMuLIzf0mM4A3h
         3MdOFQt5d7QeWxl0xtWOcqXElnIPokTV3O11yd+d1qJGsN6mbZiMzP1UUJs7bbvf637h
         /uvQBY/vKow5JXmN1Ispb3X57vczJ9SoicqnpWHXAKxgKbyXiDWU+m0M6/IEmHyhBZvp
         P9vkrglG2NknJsib/ZH13OGqw0BLT25JY4MNynbFbUlTjwHK7+Lrwpx+pOmaYSSvV6AF
         fJPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770678000; x=1771282800; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6Au6xV8PRd/zxZsbngEl9JrlNyZSnCE+btODQUCmyc=;
        b=Fi4QVJbAgqaVUx9zEEMqLkqpMAEnOYj4+VZiclMjpMOND5sffBQOB5AcLLgaM0afEY
         VuXe0X8yV3M+5y6EWwjRym+Yh8IvD32pDFSXjAkZpZkoUXoyrvzc9UOvlMjJeaTuG3Vs
         8vkFxRuesfkYHCMBJJZzXA1RwzaZ/VO+2uxokP6qA5SfjJMeNaklV+6W+7DeNuwKj37t
         LHrbq+YH22MICeFpVVBQAZX1XJxrKvEmhKfDuNAY99gLTJDdZd80scv9hpveAHfrl22O
         2RjIAvhTLMAGg3CclFQZe81Bl86sLKxoBupjmtMhvLhOpp/8qOGLcGTDysDz0Np4N90f
         wKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770678000; x=1771282800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X6Au6xV8PRd/zxZsbngEl9JrlNyZSnCE+btODQUCmyc=;
        b=N0VdDBl2jQ5n6zorQg4izZetFjrQproqhV+XZTRRXU+pPou8mJMsdfV4mYEHptSj5c
         fdzf76wRTNxJ5/aNbXy28nnRrkUEDZzO314ZxBsPgSAfvdu72oYKwccOGgb8WKhGucU8
         as/xMFUEVEHbh22A0RptMdktZuIEdZuSCwqDn/Hyj4atX8bADmtrLAzOZC58PBmo2TlL
         H89kbo2C8YnbPSY9Ga/rnGUXDwp88gEMztfMzwtq+O5svwhicBrHqt7RblN7UwdoI3ZP
         5fj1eS8RaW8ibpG6BST/DgsNFhN7mv7/Px0TBRjnNsoFtxsQ0+FUnfSaky/9DwyF8RAo
         6y7g==
X-Gm-Message-State: AOJu0YxwziWf6yw+P0V5HUUT6tLxyARmUiGyYVVhC4WvvtQKmRASu4NP
	xDIS8RGzgRcTDiQkXEUYa4eUi/uy3fTl7QZGJ2FVYYz5yWQ5gfQU68FoW4K5soAR+wq8qTyBnKb
	SVlol/DLbumgqbq5tyN3AKTPQuLJbMLw=
X-Gm-Gg: AZuq6aK5xbFptPNxYKTZ7sF6K+5KpThYfikFmsDMir0g4LAM4o73E4NQPc1Bs6GoCP5
	r2uoyxr7q7cuaoGiMVvpW0zR6PpCSHIeLWGbmLfjSVKRpJRXl9nMnJvXIO+9tHPcEdxvj82LY86
	Jy6wlFksEFT4TlUSdx7hU+KnsTZq0t3dPydlO/B2Oak1g3EaoQWovjGij71PI20Gh56LyQEA1mO
	KIXHw1VpJfB9db4iTtiSzHtlP1Zuf13iqwfumM2XoXMhUWTGxhdg2XG7pV1MZ1strm8jYBcAOTD
	BHN+GC6EpKv09jlu7jE4HUrWDV7EmEhtXMPFq6yJaYQEWoYxVYhhpEjF
X-Received: by 2002:a05:6214:2aa8:b0:896:f7ed:6eef with SMTP id
 6a1803df08f44-896f7ed7b58mr94491996d6.20.1770678000112; Mon, 09 Feb 2026
 15:00:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209005212.32370-1-enelsonmoore@gmail.com> <CAMuHMdUPX_ynhX_t8GtB7eRqF_6W4BwqC8w7SRpro-1Okxd70w@mail.gmail.com>
In-Reply-To: <CAMuHMdUPX_ynhX_t8GtB7eRqF_6W4BwqC8w7SRpro-1Okxd70w@mail.gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Mon, 9 Feb 2026 14:59:49 -0800
X-Gm-Features: AZwV_QiSC9VCcDqO3yktkcGVN4OLgv-YcSY9OG226TJzXFBcFYkY1Eq0Yy-1w48
Message-ID: <CADkSEUijZBkWbXvUtbn91NeKGtNPV99R0kU210TiqEwyM3vPRw@mail.gmail.com>
Subject: Re: [PATCH] arch: m68k: remove incomplete, unusable Apollo hardware support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Eric Biggers <ebiggers@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Thomas Huth <thuth@redhat.com>, 
	Greg Ungerer <gerg@linux-m68k.org>, Finn Thain <fthain@linux-m68k.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, Kees Cook <kees@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Wei Liu <wei.liu@kernel.org>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Sukrut Heroorkar <hsukrut3@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Geert,

On Mon, Feb 9, 2026 at 12:03=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> Thanks for your patch!
You're welcome.

> I didn't know that is a requirement;  one of the advantages of Linux
> is that you never need to reboot ;-)
Funny. I was just using it as an example of how incomplete the support is.

> Seems like you missed https://github.com/geertu/m68k-bootinfo...
I'm not sure how that happened, given that I checked every page of
GitHub code search results. Maybe they had never indexed the repo.
Would you like me to send a new version with the UAPI header and
constants retained?

> Apart from dnfb, this only removes code under arch/m68k/.
> Is any of the removed code blocking further development for you?
No, but it's better if the kernel doesn't carry around this unusable
code for no reason. People have to touch it when they make tree-wide
or architecture-wide changes, which just wastes their time.

Ethan
