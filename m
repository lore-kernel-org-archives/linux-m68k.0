Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C5526AEE
	for <linux-m68k@vger.kernel.org>; Mon, 26 May 2025 18:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748283448; cv=none; b=I2QmUZwXKeH0as7uK2O9dAPobbN7Yjpj0gkhCwjHX9kXW5WMpWlBul6aO1E2ing9D/SQouPY1wfx6tEkExQR15OKipX17403sfS9DxsiJpfCxABstlXdduME91x4fk927UlkhU9kkCN6neoTrJI4kfyryfoHO0KKwSEUcj+7JFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748283448; c=relaxed/simple;
	bh=phXbxIWqfXTq+0YpwLh7K23olcgpASCKWTRSHLB6L/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BTIz1n4vku/IulNfbxlJ2BkybS5vWa03G+Z9ewZ+rYlXAFMY9IHlwEq0j9JwQxAWuLiUL+yZ575mv9Gxi8FH836l2sNznTZTN0FdbCRUBF7W9PTTYIe8pI1pDlGCtbKd3RPtC9SGLHg8n5twUxBYn+S2a0XIcQNoo5gVbs4fXdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eTNKuHJB; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTNKuHJB"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55324587a53so913910e87.0
        for <linux-m68k@vger.kernel.org>; Mon, 26 May 2025 11:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748283445; x=1748888245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dDXb+dSW3i4v2CdzLUg8e7kwvtAfRkkU/dXvc+rqBFY=;
        b=eTNKuHJBfTM89LAjOWXGdeS/qti/RRqa7SIczehg78kJxXJlPm6QM5Aer29cW1LLxs
         exgbONtZWvyT8ZvIhpMTrxY9ASJ/irOCJBaBEGDvvmmm0N5FR/8nOokZPWlBdu/uxu96
         bNH/cqvm464ipH6grFjfTdrYLIldZptVCoKMQ8GY+WtTVJ19NzfsyEHDz0a0fiV4vwaa
         7W2PVe5tDGtyHHgNRx4PxzMeNpGYJQHN/YcIhNm/zT9h7IQCsAYahnW1tv9jLYz1ZIgz
         dhO/GMTTFDf0WGbRVAatIw1bnMDtxqMPdhNcAUQtWKlD5uYo1qcZwECFKbWzkUoNUsic
         nGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748283445; x=1748888245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dDXb+dSW3i4v2CdzLUg8e7kwvtAfRkkU/dXvc+rqBFY=;
        b=kBQegwGa1xz9Nn1LSrxyCdOdEuOzG5GpqB9eOP0uPzJoeC5ygV66ZhW5SnC491jFbx
         wViDJqNW6C+QfI29s+mMfh++6x9GP3k27YkcZ0jLopqMueCz4Txc5KU4ziMGNoCje6w8
         ctV6PnxgxdKuXehOLbmIjzvoxdJQeckyJJ/Nd889P2+ySoBDZqvoC3+kqwuW1Fw/k9KA
         sc6+XmRYWarFHcbmWBDHhiCIzKSvrgq0a5IdJBGWwSB+qkiMQ6PTb296gGtLKKHNgzC8
         jsAVnwS9iXzp9eLguzp2rUd7bSzoMY8tl8NNoc/FZtHIUn22KZ4hJ/P2lt4eT4pIC1RZ
         RCGA==
X-Forwarded-Encrypted: i=1; AJvYcCWEm4snlKGaUCfNdYJ/Q4dHFrr9iUlZoYWQszWCfh2N5C17ja9+ndz5jiBf3QA8pcQrrdFygTuz+ztw@vger.kernel.org
X-Gm-Message-State: AOJu0YxK9idOVhk0Vhz3DJxB2De1rrSTUCdrU/Goyopv9iOMMqm2CqXD
	YbkMfzQaGKOrMbih18RnunRPZ92p9PFsNMr0PwBRUVgMHAar3i0epg5iHu0H2muke/MXnHrzy7W
	RRV5jr4UFT7ikRxrex5rulug7zBm2302tmnR8
X-Gm-Gg: ASbGncuvBNGiAZ6wC5AlL7QPxRG8Qi/vgu/2xfg60yGZRmgKiryIK7FMDsS7cgTAovO
	1ljffICroEkjaZ+94FnyCWXA3TJKCeOjnl7/tYtIqqVr65R9fMegzCgd39fYJuLe/218wKtFgL1
	zBOqWBk8jycB4rloqSDVKuRGOpNK+eYsE=
X-Google-Smtp-Source: AGHT+IGVV9T4kQz7X+UPd1/lYTW9iFSVSeRoRThyHpZHMSH5VuxqqsBkZHwCSjztJUiM+WQdx+XzDXHzQFxMSlUHY/M=
X-Received: by 2002:a05:651c:1502:b0:30b:ee0c:8475 with SMTP id
 38308e7fff4ca-3295b26e7a8mr27783361fa.15.1748283444276; Mon, 26 May 2025
 11:17:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
In-Reply-To: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
Reply-To: noloader@gmail.com
From: Jeffrey Walton <noloader@gmail.com>
Date: Mon, 26 May 2025 14:16:46 -0400
X-Gm-Features: AX0GCFsNfJzA_rPx1ElOxrfIx1055opIor1AxFNXtxUewIsEocg89EZ72GAgS7I
Message-ID: <CAH8yC8=bbDMNFLj=eQzW+ZHvJpH0ZdVQthfscTo1fe0w=wnU_g@mail.gmail.com>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>, 
	linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 11:05=E2=80=AFAM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hi,
>
> I'm currently testing enabling 4 bytes alignment and first started lookin=
g into
> what NetBSD does (gcc/config/m68k/linux.h in the GCC source). Surprisingl=
y, this
> is set to 64 and not 32 bits for the largest possible alignment.
>
> The explanation is as follows:
>
> /* No data type wants to be aligned rounder than this.
>    For m68k/SVR4, some types (doubles for example) are aligned on 8 byte
>    boundaries */
>
> #undef BIGGEST_ALIGNMENT
> #define BIGGEST_ALIGNMENT 64
>
> BIGGEST_ALIGNMENT is what's being toggled with the -malign-int option
> in gcc/config/m68k/m68k.h:
>
> /* No data type wants to be aligned rounder than this.
>    Most published ABIs say that ints should be aligned on 16-bit
>    boundaries, but CPUs with 32-bit busses get better performance
>    aligned on 32-bit boundaries.  */
> #define BIGGEST_ALIGNMENT (TARGET_ALIGN_INT ? 32 : 16)
>
> In order to test GCC on Linux/m68k with 32-bit alignment, I just copied
> the definitions from netbsd-elf.h into linux.h above which eventually
> failed with:
>
> free(): invalid pointer
> during GIMPLE pass: slp
> ../../../../../src/libstdc++-v3/src/c++17/floating_from_chars.cc: In func=
tion 'std::from_chars_result std::from_chars(const char*, const char*, doub=
le&, chars_format)':
> ../../../../../src/libstdc++-v3/src/c++17/floating_from_chars.cc:1243:1: =
internal compiler error: Aborted
>
> Now I'm wondering whether why some types on NetBSD such as double have 8 =
bytes
> alignment on a 32-bit system. Does anyone know the reasoning for that?
>
> And does libstdc++ have an additional codepath on NetBSD to deal with the
> largest possible alignment to be 8 bytes so that the error above does not
> occur?
>
> Or could it just be a result of the ABI mismatch because glibc needs to b=
e
> patched as well?

I don't know about the 64 byte alignment on NetBSD. Maybe it was
copied/pasted/modified from amd64? amd64 has a BIGGEST_ALIGNMENT of 64
due to AVX512. Prior to that, I believe amd64 had a BIGGEST_ALIGNMENT
of 32 due to AVX. (These were due to the aligned loads, like
_mm256_load_epi32 (32-byte requirement) or _mm512_load_epi32 (64-byte
requirement)).

For PowerPC with Altivec, I believe BIGGEST_ALIGNMENT should be 16.

I don't know if __ALTIVEC__ plays a part in BIGGEST_ALIGNMENT. That
is, should BIGGEST_ALIGNMENT be 4 (for int) or 8 (for doubles) unless
__ALTIVEC__ is defined; and if __ALTIVEC__ is defined, then
BIGGEST_ALIGNMENT should be 16.

Jeff
