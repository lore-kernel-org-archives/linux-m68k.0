Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C14C2DF68
	for <linux-m68k@lists.linux-m68k.org>; Fri,  7 Mar 2025 16:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741365092; cv=none; b=R586pR8CAhS8DqOyTRhkaGsfXhgulhWie4u7tVbxrQ1G4EfhgWCwgNwHjNjdAzxeyDmI5d+tmP4FNI3lv4t89hrx0oSQk+KJ6PwpWuKOlmQGY5gDAspyEOJDHQS+a+aGGVhr3Dk0eOsz+3k/TDRbf7NHCk1kbLe6yAoxeJzDGnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741365092; c=relaxed/simple;
	bh=lAJPfgwy80djfUD6Dp0fH1s3yX48TIE7w1QicCUh1KI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B4157airE/tYvMwpTzvm1UYJiqnMzymtEvXEE+9QMfpyakstu07LF6RtvmD6iOzZ7mFWeCbEFDk6gSZdF4CKira3ggT5wFAjkcOcvv4O1XHkJtkN2z42UfztHJIg5t98yMcZZPudhEKc2ot03gqJxOUHtIn2wZtaBjEfrII+Vps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNJOMUHe; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNJOMUHe"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-307325f2436so20160801fa.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 07 Mar 2025 08:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741365089; x=1741969889; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAJPfgwy80djfUD6Dp0fH1s3yX48TIE7w1QicCUh1KI=;
        b=aNJOMUHepLIsp5CjG7F+1JOTfIhbkbtWrj8Ovk1b8AvOSPA14kujXObD5H4Kho5CUW
         SAzaK+9/aHOGL8+UPH8Q3wLiC8PQB/Fh5VpaN5ZkejAjuX7uZYEVAGnMVMROiAmd0YWc
         90TFATeIJgYqbUsqrH53NOincQu3XtxGSb2F4gXuTayn8EschhBcRnBi68H509N1tYLY
         smIFZeyxpp30ay24+5gcxnMKHRC8hMPjZo2DzwIzEKUJ81uJ6SerfJJXMbrZcyz4tpwI
         MQS8J5Grzl/rFf2Kb2f31aWsOGF4CzX6DeGHbmd2V/7Jnutv+MyIWO0ClKyaQIImE99F
         Qyyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741365089; x=1741969889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAJPfgwy80djfUD6Dp0fH1s3yX48TIE7w1QicCUh1KI=;
        b=AECta2GSFZiwCJIBamYpzoSZBKzB4Yt2SS6hqWwThcLzofVCn7dHPZIjjNUNvVGpgm
         +GhNWvas8SPSpnyDhM/IL6XFU3IT31ztCOe3iqdI7LVQ7Rev5DOndQ9pX25I+KCAFdvr
         7ns6IMbDU//XdiyIBOPBwJTZLg+9oqJ9avixMzEeNqsCOVAoOBzcvOYxw4FZqnsyx/g3
         ok4bzt27jk+9CkGS3GbqH0JS1YAteZL2o53pN6UBfQEeTQFQtTfy6dnIYBjGm1zBZvDX
         xxdf7MCSDbIPrw1Mav8BO+WjnyXpM7YJvJbxW7HF7LgF54kaU7wmwtpwlX51HWctQkm4
         GAZw==
X-Forwarded-Encrypted: i=1; AJvYcCX3G8EmQgVv535as3Hi9iJS50zwzM8V9wDCJGBntD3/LSLvZKAmSi2c3qIWzo4Zas89eUDG0t31gXoI@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyiIkRWPSjJT40dc5tg/B21U2TwNKtzrtUP9vVO3dRpFKf89nKv
	EZ5o4ECbGwW2xLkoeVfYMlpAMt41sOyIbpiDGeo2I/dJKXX4/IsjdGObJ446E79Hns0YM57oKPS
	DZB2yzcOi6tcNmYV0tRhdyI+I33Q=
X-Gm-Gg: ASbGncucnuILQUpokUg/l83QOokz8YJdPTYGKfSW08EzK4or+UfaeGFwdSmPATYQQXz
	4IZMH0XrHlOORcMsGrDT8sSKtUHPoI+VkCnOiO2JVAUzHn7f2zPq6auJNnrSi2iYlyrr2VxWuUv
	AFjthGJmeNTXrr5eX8PKnUThYAmV8Jf4a2pt5fXfsN8wIQd262yexL4/yNKvXH
X-Google-Smtp-Source: AGHT+IEgEmihwEMplxNvvkQvj5VuR9SKkH2j1mgoi1vrJUJlhmNG3YpZPhWz5+QONvVJZUVJ5MwX6UXtoR+OGwuCJVI=
X-Received: by 2002:a05:651c:1689:b0:308:fbd5:9d2d with SMTP id
 38308e7fff4ca-30bf463a73dmr11788591fa.37.1741365089031; Fri, 07 Mar 2025
 08:31:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250221-printf-kunit-convert-v5-0-5db840301730@gmail.com>
 <20250221-printf-kunit-convert-v5-1-5db840301730@gmail.com>
 <Z8mUH0comOCpycpK@pathway.suse.cz> <CAJ-ks9nFSzRXFauavzSWhvhr2Rou7qqkWi_LZ=4e1Tyr4_bn3g@mail.gmail.com>
 <CAJ-ks9nDLGvzZ+NDAJsk2Hy1=hsCzayg4-65gk60T_WJZzOUzA@mail.gmail.com> <Z8sW1QBgPVUmEzUd@pathway.suse.cz>
In-Reply-To: <Z8sW1QBgPVUmEzUd@pathway.suse.cz>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 7 Mar 2025 11:30:52 -0500
X-Gm-Features: AQ5f1Jqj8z8Xnln11dqVW0XOSqH1XoW79G51FNEA7K4iaFdlgfDG9Z_Ubvj7D_E
Message-ID: <CAJ-ks9=YWas3fUeUOYLhivb+icMczafmfBopvS77-CCWQyKQBQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] printf: convert self-test to KUnit
To: Petr Mladek <pmladek@suse.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, David Gow <davidgow@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 7, 2025 at 10:55=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> Honestly, I am not able to find how the KUNIT_FAIL() actually prints
> the message. I can't find how assert_format() is defined.

KUNIT_FAIL -> KUNIT_FAIL_ASSERTION -> _KUNIT_FAILED ->
__kunit_do_failed_assertion -> kunit_fail -> kunit_print_string_stream
-> kunit_err(test, "%s", buf);

So I agree that the trailing newline is just as necessary here as in
any other printk.
