Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCA618B470
	for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Mar 2025 17:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741886942; cv=none; b=OqZkrQQMEYHuJri2xeoXttgLE/j9E5e7xfpLQVmyVOkwPn22NmYjB8SAZflPZuRC76j6SxhSF210+6mdtxCLlqK1uAGVKrs1NjSexw3QOMheZ6wq/vWqUOe7a2px+N4G01oB+74VbNALRe8gBoUndAVqIXyi4S6c0Hol5+nlqgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741886942; c=relaxed/simple;
	bh=pCKx8h4RdPEXnrliEof7w9TGctCJ+lkyJAvPxZvj8as=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sQkyLnUUKaebXcIRG5wQ4027ancZQRj85ykL3w8XRFpTpsK11cvsLT7ucs4Pn1VZKXeBcfZ6zRtY0DAwHdW7cqXdMvBNvVJIqvijyWdcXfCiY27iBGCYKouq/TT6JoUKqSjlo9rmB8DMAs8bHQflngpKe8fjhqWiV/ZpGvpcL2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsiJ1vS4; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WsiJ1vS4"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 088A65C62A2;
	Thu, 13 Mar 2025 17:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78296C4CEDD;
	Thu, 13 Mar 2025 17:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741886938;
	bh=pCKx8h4RdPEXnrliEof7w9TGctCJ+lkyJAvPxZvj8as=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WsiJ1vS4VkmRkEQ91gUkBcXJpHCkjiQdXuKiOQrrIiFFBXTiyzWC1lNxpbasmhUpq
	 3JfyOHYn+nAM5kLaFI7eKKMk0HVf0PYt9MfKkoBJ8D20YQKw1ngGTv9SXVphquEE2h
	 5FlTV4pustJ2ITwpRF1Mfnt55HA7MhFAT/DH8k8bfDg8uSfYhcoZzDsRwQ4++FKCuA
	 ot/lfD8WMiYADiTKuF+3761zflCg4viKvvK9vcUUI5qt7A6AsUxSPP/q9N2rzjlyFr
	 zE/pTffZvM1VqP7YEYZUp20FKgVv5uizsSJhZI1T/0EIjucCggWl2hxTSmb3uw6p4S
	 9WKQ0vOSUIRTA==
From: Kees Cook <kees@kernel.org>
To: Arpitha Raghunandan <98.arpi@gmail.com>,
	David Gow <davidgow@google.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Tamir Duberstein <tamird@gmail.com>
Cc: Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org,
	workflows@vger.kernel.org
Subject: Re: [PATCH v6 0/3] printf: convert self-test to KUnit
Date: Thu, 13 Mar 2025 10:28:50 -0700
Message-Id: <174188692856.3317505.16138391415680640168.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250307-printf-kunit-convert-v6-0-4d85c361c241@gmail.com>
References: <20250307-printf-kunit-convert-v6-0-4d85c361c241@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 07 Mar 2025 17:08:55 -0500, Tamir Duberstein wrote:
> This is one of just 3 remaining "Test Module" kselftests (the others
> being bitmap and scanf), the rest having been converted to KUnit.
> 
> I tested this using:
> 
> $ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=1 printf
> 
> [...]

Applied to for-next/move-kunit-tests, thanks!

[1/3] printf: convert self-test to KUnit
      https://git.kernel.org/kees/c/7a79e7daa84e
[2/3] printf: break kunit into test cases
      https://git.kernel.org/kees/c/81a03aa9b88c
[3/3] printf: implicate test line in failure messages
      https://git.kernel.org/kees/c/034bee685fd4

Take care,

-- 
Kees Cook

