From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: Re: [PATCH] selftests/exec: allow shell return code of 126
Date: Mon, 05 Jan 2015 12:03:39 -0700
Message-ID: <54AAE00B.1020809__13556.6262797967$1420484666$gmane$org@osg.samsung.com>
References: <1420456786-5989-1-git-send-email-drysdale@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1420456786-5989-1-git-send-email-drysdale@google.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: David Drysdale <drysdale@google.com>, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-m68k@lists.linux-m68k.org, linux-api@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>

On 01/05/2015 04:19 AM, David Drysdale wrote:
> When the shell fails to invoke a script because its path name
> is too long (ENAMETOOLONG), most shells return 127 to indicate
> command not found.  However, some systems report 126 (which POSIX
> suggests should indicate a non-executable file) for this case,
> so allow that too.
> 
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: David Drysdale <drysdale@google.com>
> ---
>  tools/testing/selftests/exec/execveat.c | 28 ++++++++++++++++++++++------
>  1 file changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/testing/selftests/exec/execveat.c b/tools/testing/selftests/exec/execveat.c
> index d273624c93a6..0d940c6e26bd 100644
> --- a/tools/testing/selftests/exec/execveat.c
> +++ b/tools/testing/selftests/exec/execveat.c
> @@ -62,7 +62,7 @@ static int _check_execveat_fail(int fd, const char *path, int flags,
>  }
>  
>  static int check_execveat_invoked_rc(int fd, const char *path, int flags,
> -				     int expected_rc)
> +				     int expected_rc, int expected_rc2)

This logic doesn't scale well if there other expected return
values to account for. Please think about a re-write to handle
multiple expected return codes.


>  {
>  	int status;
>  	int rc;
> @@ -99,9 +99,19 @@ static int check_execveat_invoked_rc(int fd, const char *path, int flags,
>  		return 1;
>  	}
>  	if (WEXITSTATUS(status) != expected_rc) {
> -		printf("[FAIL] (child %d exited with %d not %d)\n",
> -			child, WEXITSTATUS(status), expected_rc);
> -		return 1;
> +		if (expected_rc != expected_rc2) {

Please collapse expected_rc and expected_rc2 checks. You can rephrase
the error message to work for both cases.

thanks,
-- Shuah

-- 
Shuah Khan
Sr. Linux Kernel Developer
Open Source Innovation Group
Samsung Research America (Silicon Valley)
shuahkh@osg.samsung.com | (970) 217-8978
