Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F44913AA2E
	for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Aug 2024 07:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724658063; cv=none; b=Xc9Yk7/s674kKQEdBLt3+ioBzp0hJdVlgizuwNum6BIPuFNqncZcJKarIHE2KWydAxTXEn6FER8TTkoyfWhCiE/oJ3bv8mhBipNhysBP5ZaBXTd+1fyR/CnEmVMyqTTvIVO5pT3Qsuko2Ii0k9bux+eJEPo+G4zx4ACIRLyDmeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724658063; c=relaxed/simple;
	bh=mv8Pp1wkhfykBKBcC8HVYavCR2o1ge2QzhS9my8hE3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BHPlYJm4XWctJpTj/1X/zw8mCQfZd0AzOj3sC8du6vB65OFYFJBI9d2gIzD1rCUqAhIxmi0vNoX7ZAVavy/k5vMKLzUirsGM6wT6QOCuo/kTIcXHfl65qzoyIv5yQ+iP6RgAKldvze80BNnKzE9NmnWLtH99MWsmdnE2nAsvzzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6b747f2e2b7so37136667b3.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Aug 2024 00:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724658060; x=1725262860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAyv12PG4gFbZPXf6m2WyPltkHRactx6nRFArnc14NU=;
        b=JwfEr8Q6OqzkRA1O/GCVNrDxio7sh5UdQr6fCMzHUjz1llU04QRx9hRU+OsK4npcMr
         Telm+5hfpnkjxm6A0/4hSVlO7+s3hg9qSB82fdhkUC2eTU7ue6Y3Hq4aID6tsn3xsa2T
         rGdN529XEiuDsPdGsGjJ9SGHuHvRJJ1DCrfKCTGkMWmXABc1/JXnKidA9VRcPdnUm2AC
         SIyC7zFSntNOy4P19mJBF5lFk2MoSu8rL6Qo/2aAVhUXN5J15L6XbLCrJVrIyLFE0v39
         QZA62AS3HJxwS1t4Yg5pOFHaMmlF/DoW60g0ZdQG9yXL/dicByz3Wpak95/uYWeBFfJd
         ar2g==
X-Forwarded-Encrypted: i=1; AJvYcCXN97vVtk+kiLFHJgM5PZo4qKbBXswytV2pDlaObfvQos3dUKHFELzm1rVwlQA7QauLfwlvl/7UKk/H@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yzpqa2ZT83ddXQgj07u5x+Fv+je2Be8dahe4i+youhml61Oa6Gh
	D79My9qjLt0FGLrfa00i7CzVBsPVtMswoIIV9rLUQnSuqm6o7ar5PU8BxpoJ
X-Google-Smtp-Source: AGHT+IEHmSaJqCTkmve+6a0pMGDMECVmhRzu4Vxe3piDLNQL52Dp6xahBqhyfmRFg5dy4y+Zbg/kjg==
X-Received: by 2002:a05:690c:6603:b0:6ac:f8ac:7296 with SMTP id 00721157ae682-6c6242297f7mr106864017b3.1.1724658060228;
        Mon, 26 Aug 2024 00:41:00 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39a752870sm14574857b3.34.2024.08.26.00.40.59
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 00:41:00 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6b44dd520ceso38848787b3.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Aug 2024 00:40:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXdkTQdG4rjcm9FnjBV0D3PQtqSd3dvbI/uiwwo2ukD2B7jXEyFCAhmR6AsiCk2+PMEX+IlS1Jsg5nH@lists.linux-m68k.org
X-Received: by 2002:a05:690c:f84:b0:698:bde0:a2dd with SMTP id
 00721157ae682-6c62422b00bmr101766317b3.7.1724658059782; Mon, 26 Aug 2024
 00:40:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3463f1e5d4e95468dc9f3368f2b78ffa7b72199b.1723335149.git.fthain@linux-m68k.org>
In-Reply-To: <3463f1e5d4e95468dc9f3368f2b78ffa7b72199b.1723335149.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Aug 2024 09:40:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXot=WG9xca7XgiWtZmXhTJ_8oPkZoNifxUvnu21baJzg@mail.gmail.com>
Message-ID: <CAMuHMdXot=WG9xca7XgiWtZmXhTJ_8oPkZoNifxUvnu21baJzg@mail.gmail.com>
Subject: Re: [PATCH v3] m68k: Fix kernel_clone_args.flags in m68k_clone()
To: Finn Thain <fthain@linux-m68k.org>
Cc: Christian Brauner <brauner@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, 
	Stan Johnson <userm57@yahoo.com>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2024 at 2:13=E2=80=AFAM Finn Thain <fthain@linux-m68k.org> =
wrote:
> Stan Johnson recently reported a failure from the 'dump' command:
>
>   DUMP: Date of this level 0 dump: Fri Aug  9 23:37:15 2024
>   DUMP: Dumping /dev/sda (an unlisted file system) to /dev/null
>   DUMP: Label: none
>   DUMP: Writing 10 Kilobyte records
>   DUMP: mapping (Pass I) [regular files]
>   DUMP: mapping (Pass II) [directories]
>   DUMP: estimated 3595695 blocks.
>   DUMP: Context save fork fails in parent 671
>
> The dump program uses the clone syscall with the CLONE_IO flag, that is,
> flags =3D=3D 0x80000000. When that value is promoted from long int to u64=
 by
> m68k_clone(), it undergoes sign-extension. The new value includes
> CLONE_INTO_CGROUP so the validation in cgroup_css_set_fork() fails and
> the syscall returns -EBADF. Avoid sign-extension by casting to u32.
>
> Cc: Stan Johnson <userm57@yahoo.com>
> Reported-by: Stan Johnson <userm57@yahoo.com>
> Closes: https://lists.debian.org/debian-68k/2024/08/msg00000.html
> Fixes: 6aabc1facdb2 ("m68k: Implement copy_thread_tls()")
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
> Changed since v1:
>  - Cast to u32 instead of using lower_32_bits() as suggested by Geert.
> Changed since v2:
>  - Commit log ammended with -EBADF instead of -EBADFD.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.12.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
