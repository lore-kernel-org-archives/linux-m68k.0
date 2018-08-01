From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: strip is running out of memory on m68k (Haskell)
Date: Wed, 1 Aug 2018 16:40:30 +0200
Message-ID: <7af3baba-46e0-6be7-7a10-747164dca2d0@physik.fu-berlin.de>
References: <26510258-0207-9e43-0815-f6a56b8f38c3@physik.fu-berlin.de>
 <01f02625-3fef-c56f-357a-3e78ba4a4543@physik.fu-berlin.de>
 <73bbb43e-731b-5c83-f339-4db276df6901@physik.fu-berlin.de>
 <1997fe83-266d-e525-0374-3e18e5157f7e@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
In-Reply-To: <1997fe83-266d-e525-0374-3e18e5157f7e@physik.fu-berlin.de>
Content-Language: en-US
Resent-Message-ID: <1MNMvD-8hqP.A.fDD.wZcYbB@bendel>
List-URL: <https://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/7af3baba-46e0-6be7-7a10-747164dca2d0@physik.fu-berlin.de
To: Debian m68k <debian-68k@lists.debian.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On 08/01/2018 11:58 AM, John Paul Adrian Glaubitz wrote:
> I have filed https://sourceware.org/bugzilla/show_bug.cgi?id=23471 now.
> 
> Trying to find the commit now which introduced the regression.

After some debugging, it turns out to be a regression with gcc-8.

Building binutils with gcc-7 resolves the problem.

Adrian
